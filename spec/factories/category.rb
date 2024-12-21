FactoryBot.define do
  factory :category do
    trait :communication do
      { name: 'コミュニケーション', discarded_at: nil }
    end

    trait :mind do
      { name: 'マインド', discarded_at: nil }
    end

    trait :business_skill do
      { name: 'ビジネススキル', discarded_at: nil }
    end

    trait :monkey do
      { name: 'お金', discarded_at: nil }
    end

    trait :psychology do
      { name: '心理学', discarded_at: nil }
    end
  end
end
