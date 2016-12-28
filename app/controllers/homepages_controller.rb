class HomepagesController < ApplicationController

  def index
    @homepages = Homepage.all
    @disable_from_homepage = true
  end
end
