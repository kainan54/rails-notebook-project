class UserProfilesController < ApplicationController
    def profile
        @user_profile = User.find(params[:id])
    end
end
