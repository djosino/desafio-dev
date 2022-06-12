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
require 'rails_helper'

RSpec.describe Transaction, type: :model do
  describe 'associations' do
    it { should belong_to(:document) }
    it { should belong_to(:transaction_type) }
  end

  describe 'validations' do
    it { should validate_length_of(:credit_card).is_at_most(12) }

    it { should validate_presence_of(:value) }
    it { should validate_presence_of(:document_number) }
    it { should validate_presence_of(:hour) }
    it { should validate_presence_of(:owner) }
    it { should validate_presence_of(:store) }

    it { should validate_numericality_of(:value).is_greater_than_or_equal_to(0.0) }
    it { should validate_length_of(:document_number).is_equal_to(11) }
    it { should validate_length_of(:hour).is_equal_to(6) }
    it { should validate_length_of(:owner).is_at_most(14) }
    it { should validate_length_of(:store).is_at_most(19) }
  end
end
