class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room
  
  has_many :lights, dependent: :destroy

  validate :body_cannot_blacklist_words

  


  def body_cannot_blacklist_words
    blacklist = ['死ね', '馬鹿','アホ', 'カス', '消えろ', '殺', '恥さらし', 'バカ', 'あほ' ]
    if content.present? && blacklist.any?{ |word| content.include?(word) }
      errors.add(:contain_blacklist_words, "が含まれています。")
    end
  end

  with_options presence: true do
    validates :content,  length: { maximum: 300 }
  end


end

