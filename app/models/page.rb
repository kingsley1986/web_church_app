class Page < ActiveRecord::Base
  has_many :pictures, as: :picturable
  accepts_nested_attributes_for :pictures, :reject_if => proc { |attributes| attributes['image'].blank? }


  PAGE_TYPE = [  "Childrens",
                 "Youths",
                 "Elders",
                 "Food",
                 "Prison",
                 "Hospital",
                 "Sunday",
                 "Tuesday",
                 "Thursday",
                 "Father",
                 "Son",
                 "Holy Spirit" ]



  def self.swich
    Page.select do |sorted_pages|
      case sorted_pages.page_type
      when "Youths"
        Page.where(page_type: "Youths")
      when "Children"
        Page.where(page_type: "Children")
      end
    end
  end


end
