class SundaypagesController < ApplicationController

  def index
    @sunday_pages = SundayPage.all
  end
end
