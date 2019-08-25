class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts, id: :uuid do |t|
      t.integer :kind
      t.string :name
      t.decimal :initial_balance
      t.decimal :current_balance
      t.text :description
      t.jsonb :data
      t.references :user, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
