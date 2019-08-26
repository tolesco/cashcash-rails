class Category < ApplicationRecord
  belongs_to :user
  has_many :money_transactions
  enum associated_transaction_type: [:deposit, :withdrawal]
  after_commit :uncategorized_child_transactions, on: :destroy

  def uncategorized_child_transactions
    # Search for transactions and uncategorized
  end
end
