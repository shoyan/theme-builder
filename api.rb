require 'sinatra'

get '/' do
  'Hello world!'
end

get '/build' do
  `./build.sh`
  'http://localhost:4567/download/_g_20160304_xxx.tar.gz'
end

get '/download/:filename' do |filename|
  send_file "./files/#{filename}", :filename => filename, :type => 'Application/octet-stream'
end
