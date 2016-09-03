class HomepagesController < ApplicationController

  def index
    @homepages = Homepage.all
  end
end
