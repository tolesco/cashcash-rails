class Reconciliation < ApplicationRecord
  belongs_to :account
  before_create :set_past_balance_and_amount
  after_commit :update_account_balance, on: :create
  
  private
  
  def set_past_balance_and_amount
    self.past_balance = self.account.current_balance
    self.amount = self.new_balance - self.past_balance
  end

  def update_account_balance
    self.account.update(current_balance: self.new_balance)
  end
end
