class HolyspiritpagesController < ApplicationController

  def index
    @holyspiritpages = HolyspiritPage.all
  end
end
