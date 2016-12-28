FactoryGirl.define do
  factory :user do
    email                   "admin@example.com"
    password                "password"
    password_confirmation   "password"
    first_name              "king"
    last_name              "carter"
    phone                  "993838383838"
    gender                 "male"
  end
end
