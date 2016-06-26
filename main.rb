require "sinatra"
require "sendgrid-ruby"
require "googlecharts"
require "Gchart"


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

get "/contact" do
	erb :contact
end

post "/login" do
	@num1 = params[:quiz].to_i
	array1 = []
	array1.push(@num1)

	@chart1 = Gchart.bar( 
			:data => array1, 
            :title => 'Your javascript level', 
            :legend => array1, 
            :bg => {:color => '76A4FB', :type => 'solid'}, 
            :bar_colors => 'ff0000'
            )

	erb :login
end

post "/email_response" do
	
	 mail_person = SendGrid::Client.new do |mp|
	   mp.api_key = ENV["SENDGRID_APIKEY"]
	 end

	mail = SendGrid::Mail.new do |m|
	m.to = params[:to]
	m.from = params[:from]
	m.subject = params[:subject]
	m.text = params[:body]
	end


	response = mail_person.send(mail)

	puts response.code
	puts response.body
	redirect "/email"
end




























