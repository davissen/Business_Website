require "sinatra"
require "sendgrid-ruby"


get "/" do
	erb :index
end

get "/dream_code" do
	erb :dream_code
end

get "/test" do
	erb :test
end

get "/login" do
	erb :login
end