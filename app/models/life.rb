class Life < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_many :yells, dependent: :destroy

  belongs_to :how_long
  belongs_to :month
  belongs_to :tired
  belongs_to :want


  with_options presence: true do
    validates :bad_thing
    validates :hope
    validates :title,  length: { maximum: 40 }

    with_options numericality: { other_than: 1 } do
      validates :tired_id
      validates :how_long_id
      validates :want_id
      validates :month_id
    end
  end
  
end
