class UserProfilesController < ApplicationController
    def profile
        @user_profile = User.find(params[:id])
    end

    def toggle_follow

        id = params[:followed_id].to_i
        return if current_user.id == id

        current_user.is_following(id) ? FollowJoin.where(follower_id: current_user.id, followed_id: id).destroy : FollowJoin.create(follower_id: current_user.id, followed_id: id)
    end
end
