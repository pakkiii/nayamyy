class Like < ApplicationRecord
  belongs_to :life
  belongs_to :user
  validates_uniqueness_of :life_id, scope: :user_id
end
