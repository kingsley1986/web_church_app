class SonpagesController < ApplicationController

  def index
    @songpages = SonPage.all
  end
end
