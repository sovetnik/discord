# frozen_string_literal: true
FactoryGirl.define do
  factory :entity do
    parent_id 1
    sort_order 1
    kind 'MyString'
    name 'MyString'
    desc 'MyText'
    deps ''
  end
end
