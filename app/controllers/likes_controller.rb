class LikesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  
  
  def create
    @like = current_user.likes.create(life_id: params[:life_id])

    life = Life.find(params[:life_id])
    life.create_light_like(current_user)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @like = Like.find_by(life_id: params[:life_id], user_id: current_user.id)
    @like.destroy
    redirect_back(fallback_location: root_path)
  end



end
