class Category < ApplicationRecord
  belongs_to :user
  enum associated_transaction_type: [:deposit, :withdrawal]
end
