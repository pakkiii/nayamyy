class LivesController < ApplicationController

  before_action :authenticate_user!, only: [:new, :show]

  def index
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

  private
  def life_params
    params.require(:life).permit(:bad_thing, :hope, :tired_id, :how_long_id, :want_id, :month_id).merge(user_id: current_user.id)
  end


end
