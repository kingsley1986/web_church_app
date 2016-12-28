class TuesdaypagesController < ApplicationController

  def index
    @tuesday_pages = TuesdayPage.all
  end
end
