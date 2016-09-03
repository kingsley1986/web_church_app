class ChildrenpagesController < ApplicationController

  def index
    @childrenpages = ChildrenPage.all
  end
end
