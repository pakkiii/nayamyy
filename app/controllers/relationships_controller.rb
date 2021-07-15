class RelationshipsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  
  def create
    @other_user = User.find(params[:follower])
    current_user.follow(@other_user)
    @other_user.create_light_follow(current_user)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @user = current_user.relationships.find(params[:id]).follower
    current_user.unfollow(params[:id])
    redirect_back(fallback_location: root_path)
  end
end
