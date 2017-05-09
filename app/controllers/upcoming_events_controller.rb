class  UpcomingEventsController < ApplicationController

  def new
    @upcoming_events =  UpcomingEvent.new
  end

  def create
    @upcoming_event = UpcomingEvent.create(upcoming_events_params)
    if @upcoming_event.save
      redirect_to upcoming_events_path
    end
  end

  def index
    @upcoming_events = UpcomingEvent.all
  end

  def upcomings
    @upcomings = UpcomingEvent.where("starting_from > ? ", Time.now)
  end

  def past_events
    @past_events = UpcomingEvent.where("ending_time < ? ", Time.now)
  end

  def live_events
    @live_events =  UpcomingEvent.all
      # @live_events = u if u.starting_from..u.ending_time.tap { |h| h == DateTime.now}
      # date_months = date_range.map {|d| Date.new(d.year, d.month, 1) }.uniq

      # if Time.now >= u.starting_from && u.starting_from <= u.ending_time
      # @live_events = u  if Time.now >= u.starting_from && u.starting_from <= u.ending_time
  end


  def upcoming_events_params
    params.require(:upcoming_event).permit(:title, :body, :starting_from, :ending_time, pictures_attributes: [:id, :upcoming_event_id, :image] )
  end
end
