FactoryBot.define do
  factory :yell do
    content     { '今日もお疲れ様＾０＾' }
    association :life
    association :user
  end
end
