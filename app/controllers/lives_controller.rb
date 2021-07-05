class LivesController < ApplicationController

  before_action :authenticate_user!, only: [:new, :show]

  def index
  end

  def show
    @life = Life.find(params[:id])
  end

  def new
    @life = Life.new
  end

  def create
    @life = Life.new(life_params)
    if @life.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @life = Life.find(params[:id])
    @life.destroy
    redirect_to root_path
  end

  private
  def life_params
    params.require(:life).permit(:title, :bad_thing, :hope, :tired_id, :how_long_id, :want_id, :month_id).merge(user_id: current_user.id)
  end


end
