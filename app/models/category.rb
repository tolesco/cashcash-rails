class Category < ApplicationRecord
  store_accessor :data, :immortal
  belongs_to :user
  has_many :money_transactions
  enum associated_transaction_type: [:deposit, :withdrawal]
  before_destroy :check_for_immortality
  before_destroy :uncategorized_child_transactions

  def uncategorized_child_transactions
    # Search for transactions and uncategorized
    self.money_transactions.each do |t|
      if t.deposit?
        t.update(category: Category.where('data @> ? AND associated_transaction_type = ?',{immortal: true}.to_json, Category.associated_transaction_types[:deposit]).first)
      else
        t.update(category: Category.where('data @> ? AND associated_transaction_type = ?',{immortal: true}.to_json, Category.associated_transaction_types[:withdrawal]).first)
      end
    end
  end

  private

  def check_for_immortality
    if self.immortal
      errors.add(:base, 'Hey! you cannot kill an immortal category :|')
      throw(:abort)
    end   
  end

end
