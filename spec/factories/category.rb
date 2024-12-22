FactoryBot.define do
  factory :category do
    discarded_at { nil }

    trait :communication do
      { name: 'コミュニケーション' }
    end

    trait :mind do
      { name: 'マインド' }
    end

    trait :business_skill do
      { name: 'ビジネススキル' }
    end

    trait :money do
      { name: 'お金' }
    end

    trait :psychology do
      { name: '心理学' }
    end
  end
end
