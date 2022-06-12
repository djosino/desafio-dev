class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.references :document, null: false, foreign_key: true
      t.references :transaction_type, null: false, foreign_key: true
      t.date :date
      t.float :value
      t.string :document_number, length: 11
      t.string :credit_card, length: 12
      t.string :hour, length: 6
      t.string :owner, length: 14
      t.string :store, length: 19

      t.timestamps
    end
  end
end
