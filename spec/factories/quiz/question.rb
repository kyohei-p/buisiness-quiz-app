FactoryBot.define do
  factory :quiz_question do
    trait :income_tax do
      { title: '所得税', question: '売上 - 必要経費 -  ⚪︎ = 課税所得。⚪︎に入る言葉は？', user_id: 2, category_id: 4 }
    end

    trait :two_minds do
      { title: '2つのマインドセット', question: '「しなやかマインドセット」で変えられるものと、B.「硬直マインドセット」で変えられないものと考えられている組み合わせで、最も適切なものはどれか。', user_id: 2, category_id: 2 }
    end

    trait :chat do
      { title: '雑談', question: '雑談の時の話題として不適切なのはどれか？', user_id: 2, category_id: 1 }
    end

    trait :listening do
      { title: '雑談', question: '相手の話を傾聴するときに不適切な行動はどれか？', user_id: 2, category_id: 1 }
    end

    trait :report_communicate_consult do
      { title: '報連相', question: '上司への報告・相談を行うタイミングとして不適切なのは？', user_id: 2, category_id: 3 }
    end
  end
end
