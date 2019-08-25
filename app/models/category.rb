class Category < ApplicationRecord
  belongs_to :user
  has_many :money_transactions
  enum associated_transaction_type: [:deposit, :withdrawal]
end
