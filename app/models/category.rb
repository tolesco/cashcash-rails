class Category < ApplicationRecord
  store_accessor :data, :immortal
  belongs_to :user
  has_many :money_transactions
  enum associated_transaction_type: [:deposit, :withdrawal]
  before_destroy :uncategorized_child_transactions

  def self.by_money_transaction_kind(user, kind)
    user.categories.where(associated_transaction_type: Category.associated_transaction_types[kind.to_s])
  end

  def uncategorized_child_transactions
    if self.immortal
      errors.add(:base, 'Hey! you cannot destroy an immortal category :|')
      throw(:abort)
    else
      uncategorized_income_category  = Category.where('data @> ? AND associated_transaction_type = ?', {immortal: true}.to_json, Category.associated_transaction_types[:deposit]).first
      uncategorized_expense_category = Category.where('data @> ? AND associated_transaction_type = ?', {immortal: true}.to_json, Category.associated_transaction_types[:withdrawal]).first
      self.money_transactions.each do |mt|
        mt.deposit? ? mt.update(category: uncategorized_income_category) : mt.update(category: uncategorized_expense_category)
      end
    end    
  end

end
