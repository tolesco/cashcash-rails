class Account < ApplicationRecord
  include Discard::Model
  belongs_to :user
  has_many :reconciliations, dependent: :destroy
  enum kind: [:cash_and_bank, :credit_card]
  after_create do
    self.update(current_balance: self.initial_balance)
  end
end
