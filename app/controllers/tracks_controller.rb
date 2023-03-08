# frozen_string_literal: true

class TracksController < ApplicationController
  authorize_resource
  
  def index
    @tracks = Track.all
  end

  def show
    @track = Track.find(params[:id])
  end
end
