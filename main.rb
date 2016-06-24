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
