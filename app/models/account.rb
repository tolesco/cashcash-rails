class Account < ApplicationRecord
  include Discard::Model
  belongs_to :user
  enum kind: [:cash_and_bank, :credit_card]
end
