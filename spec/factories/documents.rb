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
FactoryBot.define do
  factory :document do
    user

    trait :with_file do
      before :create do |document|
        file_path = Rails.root.join('spec', 'support', 'files', 'CNAB.txt')
        file = fixture_file_upload(file_path, 'text/plain')

        document.file.attach(file)
      end
    end
  end
end
