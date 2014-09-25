require 'sinatra'
require 'timezone'



get '/' do
	erb :form
end

post '/citycurrenttime' do
	city = params[:message]
	if city.include? " "
		city[" "] = "_"
	end
	begin
		all_timezones = Timezone::Zone.names
		con_city = all_timezones.find { |e| /#{city}/ =~ e }
		timezone = Timezone::Zone.new :zone => con_city
		show_time = timezone.time Time.now
		array = show_time.to_s.split(' ')
		time = array[1].split(':')
		hrs=time[0]
		mins=time[1]
		if city.include? "_"
			city["_"] = " "
		end
		if hrs.to_i > 12
			hours = hrs.to_i - 12
			"The current time in #{city} is: #{hours}:#{mins}PM"
		else 
			"The current time in #{city} is: #{hrs}:#{mins}AM"
		end
	rescue
		if city.include? "_"
			city["_"] = " "
		end
		"The current time in #{city} cannot be found in Timezone."
	end
end