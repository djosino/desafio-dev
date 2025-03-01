# frozen_string_literal: true

# == Schema Information
#
# Table name: documents
#
#  id         :bigint           not null, primary key
#  status     :integer          default("pending")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_documents_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Document, type: :model do
  describe 'attachments' do
    it { should have_one_attached(:file) }
  end

  describe 'associations' do
    it { should belong_to(:user).required }
    it { should have_many(:transactions) }
  end
end
