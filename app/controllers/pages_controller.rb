class PagesController < ApplicationController

  def childrens
    @pages = Page.where(page_type: "Childrens")
  end

  def youths
    @pages = Page.where(page_type: "Youths")
  end

  def elders
    @pages = Page.where(page_type: "Elders")
  end

  def food
    @pages = Page.where(page_type: "Food")
  end

  def prison
    @pages = Page.where(page_type: "Prison")
  end

  def hospital
    @pages = Page.where(page_type: "Hospital")
  end

  def sunday
    @pages = Page.where(page_type: "Sunday")
  end

  def tuesday
    @pages = Page.where(page_type: "Tuesday")
  end

  def thursday
    @pages = Page.where(page_type: "Thursday")
  end

  def father
    @pages = Page.where(page_type: "Father")
  end

  def son
    @pages = Page.where(page_type: "Son")
  end

  def holy_spirit
    @pages = Page.where(page_type: "Holy Spirit")
  end






  private

  def page_params
    params.require(:page).permit(:body, :page_type, pictures_attributes: [:id, :page_id, :image])
  end
end
