class TuesdaypagesController < ApplicationController

  def index
    @tuesdaypages = TuesdayPage.all
  end
end
