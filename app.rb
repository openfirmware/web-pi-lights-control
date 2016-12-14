require 'erb'
require 'json'
require 'sinatra'

enable :sessions

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
    "status": "ready"
  })
end

post '/lights', provides: ['json', 'html'] do
  action = ERB::Util.html_escape params[:action]

  if request.accept? 'text/html'
    # Use Post-Redirect-Get to avoid "Resubmit form" warnings
    session[:message] = "Command Sent: #{action}"
    redirect "/"
  else
    JSON.pretty_generate({
      "command": action,
      "status": "sent"
    })
  end
end
