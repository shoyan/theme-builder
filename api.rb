require 'sinatra'
require 'jekyll'

get '/' do
  'Hello world!'
end

get '/build' do
  Jekyll::Commands::Build.process({source: "themes/default"})
  file_name = '_g_20160304_xxx'
  `tar -zcvf files/#{file_name}.tar.gz files/#{file_name}`
  "http://localhost:4567/download/#{file_name}.tar.gz"
end

get '/download/:filename' do |filename|
  send_file "./files/#{filename}", :filename => filename, :type => 'Application/octet-stream'
end
