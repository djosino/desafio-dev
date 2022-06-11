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
    document { nil }
    transaction_type { nil }
    date { "2022-06-11" }
    value { 1.5 }
    document { "MyString" }
    credit_card { "MyString" }
    hour { "MyString" }
    owner { "MyString" }
    store { "MyString" }
  end
end
