class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories, id: :uuid do |t|
      t.integer :associated_transaction_type
      t.string :name
      t.text :description
      t.jsonb :data
      t.references :user, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
