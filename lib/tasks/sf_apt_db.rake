task :sfarts => :environment  do

	# response = HTTParty.get("http://sfarts.org/data/new_V4.cfc?method=searchFunction&dateWindow=99&disp=-1&price=-1&neighborhood=-1&searchString=&date1=Fri+Jul+10+2015+15%3A35%3A03+GMT-0700+(PDT)&date2=Fri+Jul+10+2015+15%3A35%3A03+GMT-0700+(PDT)&returnFormat=json")

	

	response = HTTParty.get("http://sfarts.org/data/new_V4.cfc", 
		:query => {
			:method => "searchFunction",
			:dateWindow => 99, 
			:disp => -1 , 
			:price => -1, 
			:neighborhood => -1, 
			:searchString => "", 
			:date1 =>"Fri Jul 10 2015 15:35:03 GMT-0700 (PDT)", 
			:date2 =>"Fri Jul 10 2015 15:35:03 GMT-0700 (PDT)",
			:returnFormat =>"json"
			},
		# :debug_output => $stdout
	)

	# puts response.body, response.code, response.message, response.headers.inspect
	# parse json instead of using above code
	body = JSON.parse(response.body)
	# puts body["COLUMNS"][6]
	
	numberOfEvents = body["DATA"].length-1

	numberOfEvents.times do |i|
		# print body["COLUMNS"][i] + " "
		# puts body["DATA"][i][30]

		# get record org info
		orgNumber = body["DATA"][i][11]
		orgName = body["DATA"][i][12]
		orgUrl = body["DATA"][i][13]

		# get event record infor
		eventNumber = body["DATA"][i][0]
		eventName = body["DATA"][i][6]
		startDate = body["DATA"][i][26]
		dateString = body["DATA"][i][9]
		timeString = body["DATA"][i][10]
		eventDesc = body["DATA"][i][7]
		ticketUrl = body["DATA"][i][20]
		ticketString = body["DATA"][i][8]
		free = body["DATA"][i][3]
		category = body["DATA"][i][31]
		eventPhone = body["DATA"][i][5]
		dateDiff = body["DATA"][i][4]

		# 
		venueName = body["DATA"][i][17]
		venueStreet = body["DATA"][i][14]
		venueCity = body["DATA"][i][15]
		venueZip = body["DATA"][i][16]
		venuePhone = body["DATA"][i][18]
		venueLat = body["DATA"][i][28]
		venueLon = body["DATA"][i][29]
		venueNeighborhood = body["DATA"][i][19]


		# puts orgName
		# puts orgUrl

		Venue.create!(
			:name => venueName, 
			:street => venueStreet, 
			:city => venueCity,
			:state => "CA", 
			:zip => venueZip, 
			:phone => venuePhone, 
			:latitude => venueLat, 
			:longitude => venueLon, 
			:venue_neighborhood => venueNeighborhood
		)

		lastVenueId = Venue.last.id

		org = nil
		if Org.find_by_org_num(orgNumber) == nil
			# create a new event if it does not exists in db
			org = Org.new()
			puts "it doesn't exist"
		else 
			# retrieve current existing one from database
			org = Org.find_by_org_num(orgNumber)
			puts "it exists"
		end

		org.update(:name => orgName, :url => orgUrl, :org_num => orgNumber)

		event = nil
		if Event.find_by_event_num(eventNumber) == nil
			# create a new event if it does not exists in db
			event = Event.new()
			puts "it doesn't exist"
		else
			# retrieve current existing one from database
			event = Event.find_by_event_num(eventNumber)
			puts "it exists"
		end


		# event is now an object
		# event.save

		# now update the current event
		event.update(
			:event_num => eventNumber, 
			:venue_id => lastVenueId,
			:org_id => orgNumber,
			:name => eventName, 
			:start_date => startDate,  
			:date_string => dateString, 
			:time_string => timeString,  
			:description => eventDesc, 
			:url => ticketUrl, 
			:ticket_rsvp_instruction => ticketString, 
			:free => free, 
			:category => category, 
			:event_phone => eventPhone, 
			:date_difference => dateDiff 
		)

		# do final save for this loop
		# event.save


		# if Event.find_by_event_num(eventNumber) == nil
		# 	Event.create!( 
		# 		:event_num => eventNumber, 
		# 		:venue_id => lastVenueId,
		# 		:org_id => orgNumber,
		# 		:name => eventName, 
		# 		:start_date => startDate,  
		# 		:date_string => dateString, 
		# 		:time_string => timeString,  
		# 		:description => eventDesc, 
		# 		:url => ticketUrl, 
		# 		:ticket_rsvp_instruction => ticketString, 
		# 		:free => free, 
		# 		:category => category, 
		# 		:event_phone => eventPhone, 
		# 		:date_difference => dateDiff 
		# 	)
		# else 
			# puts "record already exist"
		# end		

		# print org record
			# puts  i
		

	end


end