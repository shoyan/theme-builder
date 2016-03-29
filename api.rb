require 'sinatra'
require './lib/builder'

set :bind, '0.0.0.0'

get '/' do
  'Hello world!'
end

post '/build' do
  Builder.run(config: params)
end

post '/test' do
  "Hello #{params['name']}"
end

get '/download/:filename' do |filename|
  send_file "./public/sites/#{filename}", :filename => filename, :type => 'Application/octet-stream'
end

get '/form' do
  erb :form
end

post '/form' do
  "You said '#{params[:message]}'"
end
