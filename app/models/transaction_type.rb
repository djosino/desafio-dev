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
class TransactionType < ApplicationRecord
  # Relations
  has_many :transactions
end
