class Yell < ApplicationRecord
  belongs_to :user  
  belongs_to :life

  validate :body_cannot_blacklist_words


  def body_cannot_blacklist_words
    blacklist = ['死ね', '馬鹿']
    if content.present? && blacklist.any?{ |word| content.include?(word) }
      errors.add(:contain_blacklist_words, ": 禁止単語が含まれています。")
    end
  end



  with_options presence: true do
    validates :content,  length: { maximum: 300 }
  end
end
