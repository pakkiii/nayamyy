class YellsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  def create
    @yell = Yell.new(yell_params)
    @yell.user_id = current_user.id
    if @yell.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end

  end

  def destroy
    @yell = Yell.find(params[:id])
    @yell.destroy
    redirect_to root_path

  end

  def index

  end

  

  private
  def yell_params
    params.require(:yell).permit(:content).merge(user_id: current_user.id, life_id: params[:life_id])
  end
end
