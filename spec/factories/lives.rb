FactoryBot.define do
  factory :life do
    bad_thing               { '本当にしんどい' }
    hope                    { 'それでも生きていて感謝' }
    title                   { ' 今日の出来事 '}
    tired_id                { 2 }
    how_long_id             { 2 }
    want_id                 { 2 }
    month_id                { 2 }
    association :user
  end
end
