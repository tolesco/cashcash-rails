class AddDiscardedAtToAccounts < ActiveRecord::Migration[5.2]
  def change
    add_column :accounts, :discarded_at, :datetime
    add_index :accounts, :discarded_at
  end
end
