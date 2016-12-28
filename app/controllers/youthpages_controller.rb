class YouthpagesController < ApplicationController

  def index
    @youthpages = YouthPage.all
  end
end
