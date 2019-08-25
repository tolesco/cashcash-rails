class CreateMoneyTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :money_transactions, id: :uuid do |t|
      t.text :description
      t.date :done_at
      t.integer :kind
      t.decimal :amount
      t.text :notes
      t.string :cfdi_folio
      t.string :cfdi_issued_by
      t.string :cfdi_issued_rfc
      t.string :cfdi_payment_method
      t.jsonb :data
      t.references :account, foreign_key: true, type: :uuid
      t.references :category, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
