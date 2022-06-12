# frozen_string_literal: true

# == Schema Information
#
# Table name: transactions
#
#  id                  :bigint           not null, primary key
#  credit_card         :string
#  date                :date
#  document_number     :string
#  hour                :string
#  owner               :string
#  store               :string
#  value               :float
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  document_id         :bigint           not null
#  transaction_type_id :bigint           not null
#
# Indexes
#
#  index_transactions_on_document_id          (document_id)
#  index_transactions_on_transaction_type_id  (transaction_type_id)
#
# Foreign Keys
#
#  fk_rails_...  (document_id => documents.id)
#  fk_rails_...  (transaction_type_id => transaction_types.id)
#
FactoryBot.define do
  factory :transaction do
    document
    transaction_type

    date { Faker::Date.in_date_period(month: 2) }
    value { Faker::Number.decimal(l_digits: 3, r_digits: 2) }
    document_number { Faker::IDNumber.brazilian_citizen_number }
    credit_card { Faker::Number.leading_zero_number(digits: 12) }
    hour { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :time) }
    owner { Faker::String.random(length: 10) }
    store { Faker::String.random(length: 10) }
  end
end
