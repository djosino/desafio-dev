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
class Transaction < ApplicationRecord
  # Relations
  belongs_to :document, required: true
  belongs_to :transaction_type, required: true

  # Validates
  validates :credit_card, length: { maximum: 12 }

  validates :value, presence: true, numericality: { greater_than_or_equal_to: 0.0 }
  validates :document_number, presence: true, length: { is: 11 }
  validates :hour, presence: true, length: { is: 6 }
  validates :owner, presence: true, length: { maximum: 14 }
  validates :store, presence: true, length: { maximum: 19 }
end
