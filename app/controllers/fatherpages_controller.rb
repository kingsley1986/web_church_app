class FatherpagesController < ApplicationController

  def index
    @fatherpages = FatherPage.all
  end
end
