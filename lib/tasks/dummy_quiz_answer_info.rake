namespace :dummy do
  desc "Create new quizzes"
  task quiz_answer_info: :environment do
    begin
      quiz_answers = [
        { quiz_option: "純利益", is_answer: false, quiz_question_id: 1 },
        { quiz_option: "消費税", is_answer: false, quiz_question_id: 1 },
        { quiz_option: "所得控除", is_answer: true, quiz_question_id: 1 }, #正解
        { quiz_option: "税額控除", is_answer: false, quiz_question_id: 1 },
        { quiz_option: "A.才能 B.努力", is_answer: false, quiz_question_id: 2 },
        { quiz_option: "A.努力 B.才能", is_answer: true, quiz_question_id: 2 }, #正解
        { quiz_option: "A.性格 B.知識", is_answer: false, quiz_question_id: 2 },
        { quiz_option: "A.知識 B.性格", is_answer: false, quiz_question_id: 2 },
        { quiz_option: "服装", is_answer: false, quiz_question_id: 3 },
        { quiz_option: "話の速度", is_answer: true, quiz_question_id: 3 }, #正解
        { quiz_option: "目", is_answer: false, quiz_question_id: 3 },
        { quiz_option: "性格", is_answer: false, quiz_question_id: 3 },
        { quiz_option: "視覚情報", is_answer: true, quiz_question_id: 4 }, #正解
        { quiz_option: "言語情報", is_answer: false, quiz_question_id: 4 },
        { quiz_option: "聴覚情報", is_answer: false, quiz_question_id: 4 },
        { quiz_option: "直感", is_answer: false, quiz_question_id: 4 },
        { quiz_option: "医療費が高額になった場合の患者の負担を軽減する", is_answer: true, quiz_question_id: 5 }, #正解
        { quiz_option: "医療機関の収入を増やす", is_answer: false, quiz_question_id: 5 },
        { quiz_option: "医療保険料を安くする", is_answer: false, quiz_question_id: 5 },
        { quiz_option: "医療サービスの質を向上させる", is_answer: false, quiz_question_id: 5 },
        { quiz_option: "最新のニュースや時事ネタ", is_answer: false, quiz_question_id: 6 },
        { quiz_option: "趣味", is_answer: false, quiz_question_id: 6 },
        { quiz_option: "宗教や政治", is_answer: true, quiz_question_id: 6 }, #正解
        { quiz_option: "相手の持ち物や服装", is_answer: false, quiz_question_id: 6 },
        { quiz_option: "相手の言ったことをオウム返しする", is_answer: false, quiz_question_id: 7 },
        { quiz_option: "あいづちを打つ", is_answer: false, quiz_question_id: 7 },
        { quiz_option: "相手と同じ仕草をする", is_answer: false, quiz_question_id: 7 },
        { quiz_option: "伝えなければいけないことは相手の話を遮ってでも伝える", is_answer: true, quiz_question_id: 7 }, #正解
        { quiz_option: "具体的な表現で伝える", is_answer: false, quiz_question_id: 8 },
        { quiz_option: "個人の都合で引き受けられないと伝える", is_answer: true, quiz_question_id: 8 }, #正解
        { quiz_option: "理由よりも感謝や謝罪の言葉を伝える", is_answer: false, quiz_question_id: 8 },
        { quiz_option: "代案を提示する", is_answer: false, quiz_question_id: 8 },
        { quiz_option: "仕事が完了した時", is_answer: false, quiz_question_id: 9 },
        { quiz_option: "商談や会議の直前", is_answer: true, quiz_question_id: 9 }, #正解
        { quiz_option: "仕事でミスをした時", is_answer: false, quiz_question_id: 9 },
        { quiz_option: "仕事が途中の時", is_answer: false, quiz_question_id: 9 },
        { quiz_option: "推し活", is_answer: false, quiz_question_id: 10 },
        { quiz_option: "家賃・光熱費", is_answer: false, quiz_question_id: 10 },
        { quiz_option: "健康・美容", is_answer: false, quiz_question_id: 10 },
        { quiz_option: "SNSの映えを意識した買い物", is_answer: true, quiz_question_id: 10 }, #正解
        { quiz_option: "責任", is_answer: false, quiz_question_id: 11 },
        { quiz_option: "プライバシー", is_answer: false, quiz_question_id: 11 },
        { quiz_option: "課題", is_answer: true, quiz_question_id: 11 }, #正解
        { quiz_option: "立場", is_answer: false, quiz_question_id: 11 },
      ]

      quiz_answers.each do |answer|
        Quiz::Answer.create!(answer)
      end

    rescue StandardError => e
      puts "--- クイズの正解データ作成中のエラー ---"
      puts e.class, e.message
    end
  end
end
