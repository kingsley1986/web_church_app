class PagesController < ApplicationController

  def index
    case params[:scope]
    when  "children"
      @pages = Page.children
    when "youth"
      @pages = Page.youths
    when "elder"
      @pages = Page.elders
    when "food"
      @pages = Page.food
    when "prison"
      @pages = Page.prison
    when "hospital"
      @pages = Page.hospital
    when "sunday"
      @pages = Page.sunday
    when "tuesday"
      @pages = Page.tuesday
    when "thursday"
      @pages = Page.thursday
    when "father"
      @pages = Page.father
    when "son"
      @pages = Page.son
    when "holy_spirit"
      @pages = Page.holy_spirit
    end
  end
  private

  def page_params
    params.require(:page).permit(:body, :page_type, pictures_attributes: [:id, :page_id, :image])
  end
end
