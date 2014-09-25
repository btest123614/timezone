require 'sinatra'
get '/' do 
	"Hello World!!"
end
get '/about' do
	"There is something about me"
end
get '/hello' do
	"Say hellooooooo"
end
get '/hello/:name' do
	"Hell, how are you, #{params[name]}?"
get '/' do
	erb :form
end 

post '/city' do
	city = params[:message]
	"bam #{city}"
end