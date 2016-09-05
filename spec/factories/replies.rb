FactoryGirl.define do
  factory :reply do
    reply_body "reply"
    association :comment
  end
end
