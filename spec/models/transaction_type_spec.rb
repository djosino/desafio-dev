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
require 'rails_helper'

RSpec.describe TransactionType, type: :model do
  describe 'associations' do
    it { should have_many(:transactions) }
  end
end
