namespace :dummy do
  desc "Create dummy data"
  task all_data: :environment do
    ActiveRecord::Base.transaction do
      puts '--- start ---'

      puts '--- DB migrate reset ---'
      Rake::Task['db:migrate:reset'].invoke

      puts '--- dummy:userinfo ----'
      Rake::Task['dummy:user_info'].invoke

      puts '--- end ---'
    end
  end
end
