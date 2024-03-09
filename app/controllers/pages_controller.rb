class PagesController < ApplicationController
  def landing
    @listings = Listing.all
  end

end
