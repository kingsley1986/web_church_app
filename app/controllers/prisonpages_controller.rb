class PrisonpagesController < ApplicationController

  def index
    @prisonpages = PrisonPage.all
  end
end
