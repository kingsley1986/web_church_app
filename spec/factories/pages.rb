FactoryGirl.define do
  factory :page do
    body "MyString"
    page_type {Page::PAGE_TYPE.sample}
    image "MyString"
  end
end
