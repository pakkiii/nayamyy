class Life < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user

  has_many :yells, dependent: :destroy

  has_many :lights, dependent: :destroy

  has_many :liked_users, through: :likes, source: :user
  has_many :likes

  belongs_to :how_long
  belongs_to :month
  belongs_to :tired
  belongs_to :want


  with_options presence: true do
    validates :bad_thing
    validates :hope
    validates :title,  length: { maximum: 15 }

    with_options numericality: { other_than: 1 } do
      validates :tired_id
      validates :how_long_id
      validates :want_id
      validates :month_id
    end
  end

  def create_light_like(current_user)
    light = current_user.active_lights.new(
      yell_id: nil,
      life_id: id,      
      visited_id: user_id,
      action: 'like'
      )
    if light.visitor_id == light.visited_id
       light.checked = true
    end
    light.save if light.valid?
  end






  def create_light_yell(current_user, yell_id)
    temp_ids = Yell.where(life_id: id).select(:user_id).where.not("user_id = ? or user_id = ?", current_user.id, user_id).distinct 
    temp_ids.each do |temp_id|
      save_light_yell(current_user, yell_id, temp_id['user_id'])
    end
    save_light_yell(current_user, yell_id, user_id)
  end

  def save_light_yell(current_user, yell_id, visited_id)
    light = current_user.active_lights.new(
      life_id: id,
      yell_id: yell_id,
      visited_id: visited_id,
      action: 'yell'
    )
    if light.visitor_id == light.visited_id
      light.checked = true
    end
    light.save if light.valid?
  end
  
end
