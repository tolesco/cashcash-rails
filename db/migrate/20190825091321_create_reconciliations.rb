class CreateReconciliations < ActiveRecord::Migration[5.2]
  def change
    create_table :reconciliations, id: :uuid do |t|
      t.decimal :past_balance
      t.decimal :new_balance
      t.decimal :amount
      t.text :notes
      t.jsonb :data
      t.references :account, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
