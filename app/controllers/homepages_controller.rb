class HomepagesController < ApplicationController

  def index
    @homepages = Homepage.all
    @disable_homepage = true
  end
end
