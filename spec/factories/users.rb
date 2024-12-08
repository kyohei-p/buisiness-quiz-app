FactoryBot.define do
  factory :user do
    name { 'test1' }
    email { 'test1@example.com' }
    password { 'test1password' }
    is_admin { false }
  end
end
