FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    encrypted_password { Faker::Internet.password }


  end
end
