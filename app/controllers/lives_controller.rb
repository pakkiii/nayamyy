class LivesController < ApplicationController
  #before_action :authenticate_user!, only: [:new, :show]

  def index
    @lives = Life.all.order("created_at DESC")
    @count = @lives.includes(:likes).sort {|a,b| b.likes.size <=> a.likes.size}
    @yell = @lives.includes(:yells).sort {|a,b| b.yells.size <=> a.yells.size}
  end

  def show
    @life = Life.find(params[:id])
    @yell = Yell.new
    @yells = @life.yells
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

  def searc
  end

  def search
    @lives = Life.search(params[:keyword])
    @users = User.search(params[:keyword])
  end

  def family
    @lives = Life.where(tired_id:2).order('created_at DESC')
    render action: "search"
  end

  def work
    @lives = Life.where(tired_id:3).order('created_at DESC')
    render action: "search"
  end

  def school
    @lives = Life.where(tired_id:4).order('created_at DESC')
    render action: "search"
  end

  def private
    @lives = Life.where(tired_id:5).order('created_at DESC')
    render action: "search"
  end

  def other
    @lives = Life.where(tired_id:6).order('created_at DESC')
    render action: "search"
  end

  private

  

  def life_params
    params.require(:life).permit(:title, :bad_thing, :hope, :tired_id, :how_long_id, :want_id, :month_id).merge(user_id: current_user.id)
  end


end
