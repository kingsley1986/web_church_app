class ContactpagesController < ApplicationController

  def index
    @contactpages = ContactPage.all
  end
end
