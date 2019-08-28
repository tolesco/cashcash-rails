class Account < ApplicationRecord
  include Discard::Model
  belongs_to :user
  before_create do
    self.current_balance = 0.0
  end
  has_many :money_transactions, dependent: :destroy
  enum kind: [:cash_and_bank, :credit_card]

end
