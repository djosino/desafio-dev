# frozen_string_literal: true

# Document
class Document < ApplicationRecord
  has_one_attached :file

  belongs_to :user, required: true
end
