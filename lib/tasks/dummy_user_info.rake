namespace :dummy do
  desc "Create new users"
  task user_info: :environment do
    begin
      users = [
        { name: "test1", email: "test1@example.com", password: "test1password", auth0_id: ENV["AUTH_ID1"], is_admin: false },
        { name: "administrator", email: "admin@example.com", password: "adminpassword123", auth0_id: ENV["ADMIN_AUTH_ID"], is_admin: true }
      ]

      users.each do |user|
        User.create!(user)
      end
    rescue StandardError => e
      puts "--- ユーザー作成中のエラー ---"
      puts e.class, e.message
    end
  end
end
