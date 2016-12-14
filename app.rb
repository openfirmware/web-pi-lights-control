require 'json'
require 'sinatra'

get '/', provides: 'html' do
  erb :'index.html'
end

get '/index', provides: 'html' do
  erb :'index.html'
end

get '/lights', provides: 'json' do
  JSON.pretty_generate({
    "status": "ready"
  })
end

post '/lights', provides: 'json' do
  JSON.pretty_generate(params)
end
