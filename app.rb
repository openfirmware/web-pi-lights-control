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
  if request.accept? 'text/html'
    # Use Post-Redirect-Get to avoid "Resubmit form" warnings
    session[:message] = "Command Sent: #{params[:action]}"
    redirect "/"
  else
    JSON.pretty_generate(params)
  end
end
