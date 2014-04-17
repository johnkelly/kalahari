FactoryGirl.define do
  factory :user do
    email "lawrence@arabia.com"
    password "password"
    password_confirmation "password"
    auth_token "FAKETOKEN"
    first_name "Lawrence"
  end
end
