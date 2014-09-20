class HomeController < ApplicationController
  def map
    @venues = Venue.all
    if params[:startDateSearch]
        sDate = params[:startDateSearch].split('/')
        @startDateSearch = sDate[2] + "-" + sDate[0] + "-" + sDate[1]
        eDate = params[:endDateSearch].split('/')
        @endDateSearch = eDate[2] + "-" + eDate[0] + "-" + eDate[1]    
      # run search
      # @events = Event.findDates(@startDateSearch, @endDateSearch)
      @events =  Event.where("? <= start_date AND ? >= end_date", @startDateSearch, @endDateSearch)
      # @events = Event.where("@startDateSearch <= start_date AND @endDateSearch >= end_date")
    elsif params[:search]
      @events = Event.search(params[:search]).order("start_date ASC")
    elsif params[:categorySearch1] && params[:categorySearch2] 
      @cats = params[:categorySearch1] + " " +params[:categorySearch2] 
      @events = Event.findCategory( params[:categorySearch1], params[:categorySearch2])
    else
      @events = Event.where(:start_date => Date.today..Date.today.next_month.end_of_month).order('start_date ASC') 
    end

     @eventVenuesArr = []
      @events.each do |i|
        arr = []
        lat = Venue.find_by_id(@events.find_by_id(i).venue_id).latitude
        lon = Venue.find_by_id(@events.find_by_id(i).venue_id).longitude
        eventName = @events.find_by_id(i).name
        venueName = Venue.find_by_id(@events.find_by_id(i).venue_id).name
        eDate = @events.find_by_id(i).start_date
        eTime = @events.find_by_id(i).start_time
        des = @events.find_by_id(i).description
        link = @events.find_by_id(i).id
        
        arr.push(lat) #0
        arr.push(lon) #1
        arr.push(eventName) #2
        arr.push(venueName) #3
        arr.push(eDate) #4
        arr.push(eTime) #5
        arr.push(des) #6
        arr.push(link) #7
        @eventVenuesArr.push(arr) 

      end
  end

  def list
  end
end
