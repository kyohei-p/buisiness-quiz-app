namespace :dummy do
  desc "Create new quizzes"
  task quiz_answer_info: :environment do
    begin
      quiz_answers = [
        { quiz_option: "純利益", is_answer: false, quiz_question_id: 1 },
        { quiz_option: "消費税", is_answer: false, quiz_question_id: 1 },
        { quiz_option: "所得控除", is_answer: true, explanation: "所得控除とは、所得税を計算する際に、所得から一定の金額を差し引くことができる制度のことです。", quiz_question_id: 1 }, #正解
        { quiz_option: "税額控除", is_answer: false, quiz_question_id: 1 },
        { quiz_option: "A.才能 B.努力", is_answer: false, quiz_question_id: 2 },
        { quiz_option: "A.努力 B.才能", is_answer: true, explanation: "しなやかマインドセットを持つ人は、努力によって成長できると信じるため、困難な状況にも積極的に立ち向かい、自己実現を目指します。一方、硬直マインドセットを持つ人は、生まれつきの才能に固執し、失敗を恐れるため、成長の機会を逃してしまう可能性があります。", quiz_question_id: 2 }, #正解
        { quiz_option: "A.性格 B.知識", is_answer: false, quiz_question_id: 2 },
        { quiz_option: "A.知識 B.性格", is_answer: false, quiz_question_id: 2 },
        { quiz_option: "服装", is_answer: false, quiz_question_id: 3 },
        { quiz_option: "話の速度", is_answer: true, explanation: "話す速度によって、情報の伝わり方が変わります。相手のペースに合わせることで、相手は自然と自分の話に耳を傾けるようになり、説得力が向上します。", quiz_question_id: 3 }, #正解
        { quiz_option: "目", is_answer: false, quiz_question_id: 3 },
        { quiz_option: "性格", is_answer: false, quiz_question_id: 3 },
        { quiz_option: "視覚情報", is_answer: true, explanation: "メラビアンの法則によると、人はコミュニケーションにおいて、以下の割合で情報を受け取るとされています。・視覚情報（見た目）: 55% ・聴覚情報（声のトーン、声の大きさなど）: 38% ・言語情報（言葉の内容）: 7%", quiz_question_id: 4 }, #正解
        { quiz_option: "言語情報", is_answer: false, quiz_question_id: 4 },
        { quiz_option: "聴覚情報", is_answer: false, quiz_question_id: 4 },
        { quiz_option: "直感", is_answer: false, quiz_question_id: 4 },
        { quiz_option: "医療費が高額になった場合の患者の負担を軽減する", is_answer: true, explanation: "高額療養費制度は、一定の金額（自己負担限度額）を超えた医療費について、国や健康保険組合がその差額を払い戻す制度です。", quiz_question_id: 5 }, #正解
        { quiz_option: "医療機関の収入を増やす", is_answer: false, quiz_question_id: 5 },
        { quiz_option: "医療保険料を安くする", is_answer: false, quiz_question_id: 5 },
        { quiz_option: "医療サービスの質を向上させる", is_answer: false, quiz_question_id: 5 },
        { quiz_option: "最新のニュースや時事ネタ", is_answer: false, quiz_question_id: 6 },
        { quiz_option: "趣味", is_answer: false, quiz_question_id: 6 },
        { quiz_option: "宗教や政治", is_answer: true, explanation: "宗教や政治は、個人の価値観や信念と深く結びついています。安易な話題として取り上げることで、相手の信仰や思想を傷つけてしまう可能性があります。また、人によって意見が大きく異なるテーマのため、軽率な発言が原因で議論が白熱し、人間関係が悪化する可能性があります。", quiz_question_id: 6 }, #正解
        { quiz_option: "相手の持ち物や服装", is_answer: false, quiz_question_id: 6 },
        { quiz_option: "相手の言ったことをオウム返しする", is_answer: false, quiz_question_id: 7 },
        { quiz_option: "あいづちを打つ", is_answer: false, quiz_question_id: 7 },
        { quiz_option: "相手と同じ仕草をする", is_answer: false, quiz_question_id: 7 },
        { quiz_option: "伝えなければいけないことは相手の話を遮ってでも伝える", is_answer: true, explanation: "相手の話を遮ることは、相手の話を最後まで聞こうとする姿勢がないことを示し、相手へのリスペクトが欠けていると受け取られます。", quiz_question_id: 7 }, #正解
        { quiz_option: "具体的な表現で伝える", is_answer: false, quiz_question_id: 8 },
        { quiz_option: "個人の都合で引き受けられないと伝える", is_answer: true, explanation: "個人都合を理由に仕事を断ることは、仕事に対する責任感が低いと捉えられてしまう可能性があります。
          「今すぐには難しいですが、○月○日以降であれば、新しい仕事を始めることができます」など、代替案を示すことで、協調性があることをアピールできます。", quiz_question_id: 8 }, #正解
        { quiz_option: "理由よりも感謝や謝罪の言葉を伝える", is_answer: false, quiz_question_id: 8 },
        { quiz_option: "代案を提示する", is_answer: false, quiz_question_id: 8 },
        { quiz_option: "仕事が完了した時", is_answer: false, quiz_question_id: 9 },
        { quiz_option: "商談や会議の直前", is_answer: true, explanation: "商談や会議直前の報告は、上司に急な対応を要求することになり、心理的な負担を増やしてしまう可能性があります。", quiz_question_id: 9 }, #正解
        { quiz_option: "仕事でミスをした時", is_answer: false, quiz_question_id: 9 },
        { quiz_option: "仕事が途中の時", is_answer: false, quiz_question_id: 9 },
        { quiz_option: "推し活", is_answer: false, quiz_question_id: 10 },
        { quiz_option: "家賃・光熱費", is_answer: false, quiz_question_id: 10 },
        { quiz_option: "健康・美容", is_answer: false, quiz_question_id: 10 },
        { quiz_option: "SNSの映えを意識した買い物", is_answer: true, explanation: "SNSでは、特定のアイテムや場所が短期間で流行ることがあります。その流行に乗っかって購入してしまうと、流行が終わった後に使わなくなる可能性が高くなります。", quiz_question_id: 10 }, #正解
        { quiz_option: "責任", is_answer: false, quiz_question_id: 11 },
        { quiz_option: "プライバシー", is_answer: false, quiz_question_id: 11 },
        { quiz_option: "課題", is_answer: true, explanation: "課題の分離とは、簡単に言うと、自分の問題（課題）と、他人の問題（課題）を明確に分けるということです。自分の課題と他人の課題を混同してしまうと、相手に責任転嫁したり、逆に相手のことに過度に干渉したりして、人間関係を悪化させる原因になります。", quiz_question_id: 11 }, #正解
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
