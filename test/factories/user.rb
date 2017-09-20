FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password 'password'
    password_confirmation 'password'
  end

  factory :admin, class: User do
    email { Faker::Internet.email }
    password 'immaadmin1'
    password_confirmation 'immaadmin1'
    roles :admin
  end

  factory :editor, class: User do
    email { Faker::Internet.email }
    password 'immaeditor'
    password_confirmation 'immaeditor'
    roles :editor
  end
end
