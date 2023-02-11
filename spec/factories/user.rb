FactoryBot.define do
  factory :user do
    name { 'zuhaib' }
    created_at { Time.now }
    updated_at { Time.now }
    email { 'zuhaib@example.com' }
    password { '123456' }
  end
end
