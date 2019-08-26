class MoneyTransaction < ApplicationRecord
  belongs_to :account
  belongs_to :category
  has_one_attached :invoice
  has_one_attached :cfdi_pdf
  has_one_attached :cfdi_xml
  enum kind: [:deposit, :withdrawal]
  after_commit :update_account_balance, on: [:create, :update, :destroy]
  validates_presence_of :amount, :kind

  def update_account_balance
    new_account_balance = 0.0
    self.account.money_transactions.each do |mt|
      case mt.kind
      when 'deposit'
        new_account_balance += mt.amount
      when 'withdrawal'
        new_account_balance -= mt.amount
      end
    end
    self.account.update(current_balance: new_account_balance)
  end
end
