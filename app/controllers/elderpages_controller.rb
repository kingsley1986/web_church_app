class ElderpagesController < ApplicationController

  def index
    @elderpages = ElderPage.all
  end
end
