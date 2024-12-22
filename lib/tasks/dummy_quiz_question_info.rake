namespace :dummy do
  desc "Create new quiz_question"
  task quiz_question_info: :environment do
    begin
      quiz_questions = [
        { title: "所得税", question: "所得税は、以下のような計算式で計算される。売上 - 必要経費 -  ⚪︎ = 課税所得 課税所得 × 税率 - 控除額 = 所得税 ⚪︎に入る言葉は？", user_id: 2, category_id: 4 },
        { title: "2つのマインドセット", question: "心理学者のキャロル・S・ドゥエックは、「しなやかマインドセット」と「硬直マインドセット」という考え方を紹介しています。A.「しなやかマインドセット」で変えられるものと、B.「硬直マインドセット」で変えられないものと考えられている組み合わせで、最も適切なものはどれか。", user_id: 2, category_id: 2 },
        { title: "ペーシング", question: "ペーシングとは、相手とのペースを合わせるコミュニケーションスキルです。相手の話し方や行動を観察し、⚪︎や声の高さ、相づちや頷きのタイミング、話し方、声のトーンなどを相手に合わせます。○に入る言葉は？", user_id: 2, category_id: 1 },
        { title: "メラビアンの法則", question: "コミュニケーションにおいて、人に一番影響を与えるのは？", user_id: 2, category_id: 1 },
        { title: "高額療養費制度", question: "高額療養費制度の主な目的は次のうちどれでしょうか？", user_id: 2, category_id: 4 },
        { title: "雑談", question: "雑談の時の話題として不適切なのはどれか？", user_id: 2, category_id: 1 },
        { title: "傾聴", question: "相手の話を傾聴するときに不適切な行動はどれか？", user_id: 2, category_id: 1 },
        { title: "タスク管理", question: "あなたは複数の仕事を抱えているとします。上司から追加で仕事を頼まれて断る時の不適切な行動は？", user_id: 2, category_id: 3 },
        { title: "報連相", question: "上司への報告・相談を行うタイミングとして不適切なのは？", user_id: 2, category_id: 3 },
        { title: "浪費", question: "次の4つのうちから浪費になりうるものはどれか", user_id: 2, category_id: 4 },
        { title: "アドラー心理学", question: "アドラー心理学において、自分の○○と他者の○○を明確に区別することが大切だと言われる。○○に入る言葉は？", user_id: 2, category_id: 5 }
      ]

      quiz_questions.each do |question|
        Quiz::Question.create!(question)
      end

    rescue StandardError => e
      puts "--- クイズ問題データ作成中のエラー ---"
      puts e.class, e.message
    end
  end
end
