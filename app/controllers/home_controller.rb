class HomeController < ApplicationController

  def index
    @tracks = Track.all.includes(:scholar)
  end

end
