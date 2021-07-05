class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :lives, dependent: :destroy

  validates :name, presence: true
  with_options numericality: { other_than: 0 } do
    validates :sex
  end
end
