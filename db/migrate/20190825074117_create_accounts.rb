class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts, id: :uuid do |t|
      t.integer :kind,            null: false
      t.string :name,             null: false, default: ''
      t.decimal :current_balance, null: false, default: 0.0
      t.text :description
      t.jsonb :data
      t.references :user, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
