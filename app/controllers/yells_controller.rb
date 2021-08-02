class YellsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  before_action :set_lives, only: [:create, :destroy]

  def create
    @yell = Yell.create(yell_params)
    @yell.user_id = current_user.id
    if @yell.save
      @life.create_light_yell(current_user, @yell.id)
      redirect_to life_path(params[:life_id])
    else
      @yells = @life.yells
      render 'lives/show'
    end

  end

  def destroy
    @yell = Yell.find(params[:id])
    @yell.destroy
    redirect_to root_path

  end



  

  private


  def set_lives
    @life = Life.find(params[:life_id])
  end


  def yell_params
    params.require(:yell).permit(:content).merge(user_id: current_user.id, life_id: params[:life_id])
  end
end
