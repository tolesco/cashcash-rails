class Account < ApplicationRecord
  include Discard::Model
  belongs_to :user
  has_many :money_transactions, dependent: :destroy
  enum kind: [:cash_and_bank, :credit_card]
  before_create :default_values 

  def default_values
    self.current_balance = 0.0
  end

end
