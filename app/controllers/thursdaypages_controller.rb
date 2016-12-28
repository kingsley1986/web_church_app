class ThursdaypagesController < ApplicationController

  def index
    @thursday_pages = ThursdayPage.all
  end
end
