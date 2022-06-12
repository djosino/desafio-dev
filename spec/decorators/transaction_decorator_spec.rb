require 'rails_helper'

RSpec.describe TransactionDecorator do
  context 'transaction hour' do
    let(:transaction) { build(:transaction) }
    let(:formated) { transaction.hour.insert(4, ':').insert(2,':') }

    it 'formated hour' do
      expect(transaction.decorate.hour).to eq(formated)
    end
  end
end
