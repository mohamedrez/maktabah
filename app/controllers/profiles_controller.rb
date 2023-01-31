class ProfilesController < ApplicationController
    
    before_action :set_page, only: [:show, :edit, :update]

    def show
    end

    def edit
        @type = params[:type]
        @track_courses = Add_courses(@profile)
    end

    def update
        ids = params[:courses_ids]
        ids.each do |id|
            params[:type] == "a" ? @profile.courses << Course.find(id) : @profile.courses.delete(Course.find(id))
        end
        redirect_to profile_path(@profile.id)
    end

    def Add_courses(profile)
        tracks = Track.all
        track_courses = []
        tracks.each do |track|
            list_courses = []
            track.courses.each do |course|
                # if course exist in profile.courses not print
                not_exist = true
                profile.courses.each do |pc|
                    if(course.id == pc.id)
                        not_exist = false
                        break
                    end
                end
                if not_exist
                    list_courses << course
                end
            end
            track_courses << {track_name: track.name, courses: list_courses}
        end
        track_courses
    end

    private
        def profile_params  
            params.require(:profile).permit(:username, :bio) 
        end

        def set_page 
            @profile = Profile.find(params[:id]) 
        end
end