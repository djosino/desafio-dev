# frozen_string_literal: true

# == Schema Information
#
# Table name: transaction_types
#
#  id          :bigint           not null, primary key
#  description :string
#  entry       :boolean          default(FALSE)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
FactoryBot.define do
  factory :transaction_type do
    description { Faker::String.random(length: [6, 20]) }
    entry { Faker::Boolean.boolean }
  end
end
