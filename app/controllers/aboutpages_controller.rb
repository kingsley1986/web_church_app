class AboutpagesController < ApplicationController

  def index
    @about_pages = AboutPage.all
  end
end
