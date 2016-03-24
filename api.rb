require 'sinatra'
require './lib/builder'


get '/' do
  'Hello world!'
end

post '/build' do
  path = Builder.build_config_file(params)
  Builder.run(config: path)
end

post '/test' do
  "Hello #{params['name']}"
end

get '/download/:filename' do |filename|
  send_file "./public/sites/#{filename}", :filename => filename, :type => 'Application/octet-stream'
end
