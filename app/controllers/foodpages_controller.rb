class FoodpagesController < ApplicationController

  def index
    @foodpages = FoodPage.all
  end
end
