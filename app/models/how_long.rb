class HowLong < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '限界' },
    { id: 3, name: '今日中' },
    { id: 4, name: '３日以内' },
    { id: 5, name: '1週間' },
    { id: 6, name: '１ヶ月' },
    { id: 7, name: '分からない' }
  ]

  include ActiveHash::Associations
  has_many :lives
end