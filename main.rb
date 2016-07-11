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

post "/email_response" do
	#https://sendgrid.com/docs/Integrate/Code_Examples/v3_Mail/ruby.html
	# replace the example API values with the values from the value of html form using the names of the elements
	# @from = Email.new(email: params[:from])
	# @to = Email.new(email: params[:to])
	# @subject = params[:subject]
	# @body = Content.new(type: 'text/plain', value: params[:body])
	# #use above objects to create mail object
	# mail = Mail.new(from, subject, to, content)

	# sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
	# response = sg.client.mail._('send').beta.post(request_body: mail.to_json)
	# puts response.status_code
	# puts response.response_body
	# puts response.response_headers

	erb :contact

end



post "/login" do
	@html_num = params[:quizHtml].to_i
	answers = []
	answers.push(@html_num)

	@css_num = params[:quizCSS].to_i
	answers.push(@css_num)

	@javascript_num = params[:quizJavaScript].to_i
	answers.push(@javascript_num)

	@chart1 = Gchart.bar( 
			:data => answers, 
            :title => 'Your coding levels', 
            :legend => ["html", "css", "javascript"], 
            :bg => {:color => '76A4FB', :type => 'solid'}, 
            # :bar_colors => 'ff0000',
            :axis_with_labels => [['x']],
            )


	@g = Gchart.pie(
	 :data => answers,
	 :legend => answers 
	 )

	erb :login

end





























