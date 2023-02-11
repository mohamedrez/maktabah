class TracksController < ApplicationController

  def show
    @track = Track.find(params[:id])
  end

  def index
    @tracks = Track.all
  end
end
