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

array1 = [50,10,14,67,100,41,100]

get "/login" do
	@chart1 = Gchart.bar( 
			:data => array1, 
            :title => 'Your javascript level', 
            :legend => ['Nuri'], 
            :bg => {:color => '76A4FB', :type => 'solid'}, 
            :bar_colors => 'ff0000'
            )

	erb :login
end
