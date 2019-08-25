class Account < ApplicationRecord
  include Discard::Model
  belongs_to :user
  has_many :money_transactions, dependent: :destroy
  enum kind: [:cash_and_bank, :credit_card]

end
