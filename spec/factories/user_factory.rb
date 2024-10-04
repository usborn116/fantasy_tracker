FactoryBot.define do
  factory :user do
    email { 'hello@example.com' }
    password { 'password123' }
    encrypted_password { 'password123' }
  end
end