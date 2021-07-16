class LikesController < ApplicationController
  before_action :set_life
  before_action :set_yells
  
  def create
    @like = Like.create(user_id: current_user.id, life_id: params[:life_id])
    @like.save
    @life.create_light_like(current_user)
    redirect_to life_path(@life.id)
  end

  def destroy
    @like = Like.find_by(life_id: params[:life_id], user_id: current_user.id)
    @like.destroy
    redirect_to life_path(@life.id)
  end


  private
  def set_life
    @life = Life.find(params[:life_id])
  end

  def set_yells
    @yells = @life.yells
  end


end
