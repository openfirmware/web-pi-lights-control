$:.unshift File.join(File.dirname(__FILE__), 'lib')

require 'erb'
require 'json'
require 'securerandom'
require 'sinatra'
require 'lights-control'

enable :sessions
set :session_secret, SecureRandom.hex(64)

set :bind, '0.0.0.0'

get '/', provides: 'html' do
  message = session[:message]
  session[:message] = ""
  erb :'index.html', locals: { message: message }
end

get '/index', provides: 'html' do
  redirect "/"
end

get '/lights', provides: 'json' do
  JSON.pretty_generate({
    "status" => "ready"
  })
end

post '/lights', provides: ['json', 'html'] do
  action = ERB::Util.html_escape params[:action]

  if LightsControl.send_command(action)
    command_success(action)
  elsif !LightsControl.is_valid_action?(action)
    command_invalid(action)
  else
    command_failure(action)
  end
end

def command_success action
  if request.accept? 'text/html'
    # Use Post-Redirect-Get to avoid "Resubmit form" warnings
    session[:message] = "Command Sent: #{action}"
    redirect "/"
  else
    JSON.pretty_generate({
      "command" => action,
      "status"  => "sent"
    })
  end
end

def command_invalid action
  if request.accept? 'text/html'
    # Use Post-Redirect-Get to avoid "Resubmit form" warnings
    session[:message] = "Command Invalid: #{action}"
    redirect "/"
  else
    JSON.pretty_generate({
      "command" => action,
      "status"  => "invalid"
    })
  end
end

def command_failure action
  if request.accept? 'text/html'
    # Use Post-Redirect-Get to avoid "Resubmit form" warnings
    session[:message] = "Command Failed: #{action}"
    redirect "/"
  else
    JSON.pretty_generate({
      "command" => action,
      "status"  => "failure"
    })
  end
end
