FactoryBot.define do
  factory :quiz_answer do
    trait :income_tax_option_1 do
      { quiz_option: '純利益', is_answer: false, quiz_question_id: 1 }
    end

    trait :income_tax_option_2 do
      { quiz_option: '消費税', is_answer: false, quiz_question_id: 1 }
    end

    trait :income_tax_option_3 do
      { quiz_option: '所得控除', is_answer: true, quiz_question_id: 1 }
    end

    trait :income_tax_option_4 do
      { quiz_option: '税額控除', is_answer: false, quiz_question_id: 1 }
    end

    trait :two_minds_option_1 do
      { quiz_option: 'A.才能 B.努力', is_answer: false, quiz_question_id: 2 }
    end

    trait :two_minds_option_2 do
      { quiz_option: 'A.努力 B.才能', is_answer: true, quiz_question_id: 2 }
    end

    trait :two_minds_option_3 do
      { quiz_option: 'A.性格 B.知識', is_answer: false, quiz_question_id: 2 }
    end

    trait :two_minds_option_4 do
      { quiz_option: 'A.知識 B.性格', is_answer: false, quiz_question_id: 2 }
    end

    trait :chat_option_1 do
      { quiz_option: '最新のニュースや時事ネタ', is_answer: false, quiz_question_id: 3 }
    end

    trait :chat_option_2 do
      { quiz_option: '趣味', is_answer: false, quiz_question_id: 3 }
    end

    trait :chat_option_3 do
      { quiz_option: '宗教や政治', is_answer: true, quiz_question_id: 3 }
    end

    trait :chat_option_4 do
      { quiz_option: '相手の持ち物や服装', is_answer: false, quiz_question_id: 3 }
    end

    trait :listening_option_1 do
      { quiz_option: '相手の言ったことをオウム返しする', is_answer: false, quiz_question_id: 4 }
    end

    trait :listening_option_2 do
      { quiz_option: 'あいづちを打つ', is_answer: false, quiz_question_id: 4 }
    end

    trait :listening_option_3 do
      { quiz_option: '相手と同じ仕草をする', is_answer: false, quiz_question_id: 4 }
    end

    trait :listening_option_4 do
      { quiz_option: '伝えなければいけないことは相手の話を遮ってでも伝える', is_answer: true, quiz_question_id: 4 }
    end

    trait :report_communicate_consult_option_1 do
      { quiz_option: '仕事が完了した時', is_answer: false, quiz_question_id: 5 }
    end

    trait :report_communicate_consult_option_2 do
      { quiz_option: '商談や会議の直前', is_answer: true, quiz_question_id: 5 }
    end

    trait :report_communicate_consult_option_3 do
      { quiz_option: '仕事でミスをした時', is_answer: false, quiz_question_id: 5 }
    end

    trait :report_communicate_consult_option_4 do
      { quiz_option: '仕事が途中の時', is_answer: false, quiz_question_id: 5 }
    end
  end
end
