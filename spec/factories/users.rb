# == Schema Information
#
# Table name: users
#
#  id                 :integer          not null, primary key
#  email              :string           default(""), not null
#  encrypted_password :string           default(""), not null
#  name               :string           not null
#  current_cart_id    :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

FactoryGirl.define do
  factory :user do
    name "Dom"
    password "mySecret"
    email "dom@example.com"
  end
end
