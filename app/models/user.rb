class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :lives, dependent: :destroy
  has_many :yells

  has_many :likes, dependent: :destroy
  has_many :liked_lives, through: :likes, source: :life

  has_many :relationships, dependent: :destroy
  has_many :followings, through: :relationships, source: :follower

  has_many :passive_relationships, class_name: 'Relationship', foreign_key: 'follower_id', dependent: :destroy # 追記1
  has_many :follower, through: :passive_relationships, source: :use


  def follow(other_user)
    return if self == other_user

    relationships.find_or_create_by!(follower: other_user)
  end

  def following?(user)
    followings.include?(user)
  end

  def unfollow(relathinoship_id)
    relationships.find(relathinoship_id).destroy!
  end

  def already_liked?(life)
    self.likes.exists?(life_id: life.id)
  end

  

  validates :name, presence: true
  with_options numericality: { other_than: 0 } do
    validates :sex
  end
end
