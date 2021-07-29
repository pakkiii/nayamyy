class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def show
    @user = User.find(params[:id])
    @lives = @user.lives.order("created_at DESC")
    @users = User.all


    family = 0
    work = 0
    school = 0
    pribate = 0
    other = 0 
    @lives.each do |f|
      
      if f.tired_id == 2
        family += 1
      elsif f.tired_id == 3
        work += 1
      elsif f.tired_id == 4
        school += 1
      elsif f.tired_id == 5
        pribate += 1
      elsif f.tired_id == 6
        other += 1
      end
      
    end
    @pie = {
      "家族関係" =>  family,
      "仕事" => work,
      "学校" => school,
      "プライベート" =>  pribate,
      "それ以外" => other
    }


    lcount = 0
    @lives.each do |f|
      
      if f.likes.count != 0
        lcount += f.likes.count
      end
    end
    @lcount = lcount


    



    
    @currentUserEntry=Entry.where(user_id: current_user.id)
    @userEntry=Entry.where(user_id: @user.id)
    if @user.id == current_user.id
    else
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id then
            @isRoom = true
            @roomId = cu.room_id
          end
        end
      end
      if @isRoom
      else
        @room = Room.new
        @entry = Entry.new
      end
    end

  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :sex)
  end

end
