require 'sinatra'
require './lib/builder'

set :bind, '0.0.0.0'

Builder.configure do |c|
  c.delivery_dir = 'public-html'
  c.clean = true
end

get '/' do
  'Hello world!'
end

post '/build' do
  Builder.run(config: params)
  redirect request.base_url.gsub(/:[0-9]+/, '')
end

get '/download/:filename' do |filename|
  send_file "./public/sites/#{filename}", :filename => filename, :type => 'Application/octet-stream'
end

get '/build' do
  erb :form
end
