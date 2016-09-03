class ThursdaypagesController < ApplicationController

  def index
    @thursdaypages = ThursdayPage.all
  end
end
