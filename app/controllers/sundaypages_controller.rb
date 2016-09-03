class SundaypagesController < ApplicationController

  def index
    @sundaypages = SundayPage.all
  end
end
