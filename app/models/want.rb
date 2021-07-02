class Want < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '好きなことをしたい' },
    { id: 3, name: '1日ゆっくり休みたい' },
    { id: 4, name: '一定期間何もしたくない' },
    { id: 5, name: '全て捨ててどこかに逃げたい' },
    { id: 6, name: '死にたい' },
    { id: 7, name: '何も考えれない' }
  ]

  include ActiveHash::Associations
  has_many :lives
end