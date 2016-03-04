require 'sinatra'
require 'jekyll'
require 'securerandom'
require 'date'


get '/' do
  'Hello world!'
end

post '/build' do
  file_name = SecureRandom.hex
  sub_dir = Date.today.to_s
  Dir.mkdir "public/sites/#{sub_dir}" unless Dir.exist?("public/sites/#{sub_dir}")
  Jekyll::Commands::Build.process({source: "themes/default", destination: "public/sites/#{sub_dir}/#{file_name}"})
  `tar -zcvf public/sites/#{sub_dir}/#{file_name}.tar.gz public/sites/#{sub_dir}/#{file_name}`
  "http://localhost:4567/download/#{sub_dir}/#{file_name}.tar.gz"
end

post '/test' do
  "Hello #{params['name']}"
end

get '/download/:filename' do |filename|
  send_file "./public/sites/#{filename}", :filename => filename, :type => 'Application/octet-stream'
end
