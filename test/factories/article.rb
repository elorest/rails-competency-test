FactoryGirl.define do
  factory :article do
    title Faker::Beer.name
    category Faker::Job.key_skill
    content Faker::Matz.quote
  end
end
