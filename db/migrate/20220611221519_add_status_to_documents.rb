class AddStatusToDocuments < ActiveRecord::Migration[6.0]
  def change
    add_column :documents, :status, :integer, default: 0
  end
end
