require "sinatra"
require "sendgrid-ruby"

get "/" do
	erb :index
end

get "/" do
	erb :dream_code
end

get "/" do
	erb :test
end

get "/" do
	erb :login
end