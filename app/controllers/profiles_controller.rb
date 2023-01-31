class ProfilesController < ApplicationController

    before_action :set_page, only: [:show, :edit, :update]

    def show
    end

    def edit
        @tracks = Track.all
    end

    def update
        ids = params[:courses_ids]
        ids.each do |id|
            not_exist = true
            @profile.courses.each { |c| not_exist = false if c.id == id }
            @profile.courses << Course.find(id) if not_exist = true
        end
        redirect_to profile_path(@profile.id)
    end

    private
        def profile_params  
            params.require(:profile).permit(:username, :bio, courses_ids[]) 
        end

        def set_page 
            @profile = Profile.find(params[:id]) 
        end
end