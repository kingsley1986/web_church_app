module UpcomingEventsHelper


  def upcoming
    u =  UpcomingEvent.where("starting_from > ?", Time.current)
    u.all.each do |no|
      return no
    end
  end
end
