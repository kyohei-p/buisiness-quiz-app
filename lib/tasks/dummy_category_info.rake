namespace :dummy do
  desc "Create new categories"
  task category_info: :environment do
    begin
      categories = [
        { name: "コミュニケーション" },
        { name: "マインド" },
        { name: "ビジネススキル" },
        { name: "お金" },
        { name: "心理学" }
      ]

      categories.each do |category|
        Category.create!(category)
      end
    rescue StandardError => e
      puts "--- カテゴリー作成中のエラー ---"
      puts e.class, e.message
    end
  end
end
