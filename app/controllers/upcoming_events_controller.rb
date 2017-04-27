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

  def upcoming
    @upcomings = UpcomingEvent.where("starting_from > ? ", Time.now)
  end

  def past_events
    @past_events = UpcomingEvent.where("ending_time < ? ", Time.now)
  end


  def upcoming_events_params
    params.require(:upcoming_event).permit(:title, :body, :starting_from, :ending_time, pictures_attributes: [:id, :upcoming_event_id, :image] )
  end
end
