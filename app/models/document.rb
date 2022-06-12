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
class Document < ApplicationRecord
  # Attachments
  has_one_attached :file

  # enums
  enum status: {
    pending: 0,
    processing: 1,
    processed: 2,
    fail: 3
  }

  # Relations
  belongs_to :user, required: true
  has_many :transactions

  after_create :process_file

  private

  def process_file
    ProcessFileJob.perform_later(self)
  end
end
