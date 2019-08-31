class MoneyTransaction < ApplicationRecord
  belongs_to :account
  belongs_to :category
  has_one_attached :invoice
  has_one_attached :cfdi_pdf
  has_one_attached :cfdi_xml
  enum kind: [:deposit, :withdrawal]
  after_commit   :update_account_balance, on: [:create, :update]
  after_destroy  :update_account_balance
  validates_presence_of :amount, :kind

  def self.find_by_filters(user, search, account, category, date_range)
    # Get dates
    if date_range.present?
      date_range.gsub!(/\s+/, '')
      date_arr = date_range.split('-')
      begin_date = Date.parse(date_arr[0])
      end_date   = Date.parse(date_arr[1])
    end
    # Search and all filters
    if user.present? && search.present? && account.present? && category.present? && date_range.present?
      logger.info 'Search and all filters'.upcase
      return joins(:account).where('accounts.user_id = ? AND discarded_at IS NULL', user).
            where('money_transactions.description ILIKE ?', "%#{search}%").
            where(account: account, category: category, done_at: begin_date..end_date)      
    end
    # Search with account and category
    if user.present? && search.present? && account.present? && category.present?
      logger.info 'Search with account and category'.upcase
      return joins(:account).where('accounts.user_id = ? AND discarded_at IS NULL', user).
            where('money_transactions.description ILIKE ?', "%#{search}%").
            where(account: account, category: category)      
    end
    # Search with account
    if user.present? && search.present? && account.present?
      logger.info 'Search with account'.upcase
      return joins(:account).where('accounts.user_id = ? AND discarded_at IS NULL', user).
            where('money_transactions.description ILIKE ?', "%#{search}%").
            where(account: account)      
    end
    # Search with category
    if user.present? && search.present? && category.present?
      logger.info 'Search with category'.upcase
      return joins(:account).where('accounts.user_id = ? AND discarded_at IS NULL', user).
            where('money_transactions.description ILIKE ?', "%#{search}%").
            where(category: category)      
    end
    # Search with date_range
    if user.present? && search.present? && date_range.present?
      logger.info 'Search with date_range'.upcase
      return joins(:account).where('accounts.user_id = ? AND discarded_at IS NULL', user).
            where('money_transactions.description ILIKE ?', "%#{search}%").
            where(done_at: begin_date..end_date)      
    end                      
    # Only search
    if user.present? && search.present?
      logger.info 'Only search'.upcase
      return joins(:account).where('accounts.user_id = ? AND discarded_at IS NULL', user).
            where('money_transactions.description ILIKE ?', "%#{search}%")      
    end
    # All filters
    if user.present? && account.present? && category.present? && date_range.present?
      logger.info 'All filters'.upcase
      return joins(:account).where('accounts.user_id = ? AND discarded_at IS NULL', user).
             where(account: account, category: category, done_at: begin_date..end_date)      
    end
    # Account and category
    if user.present? && account.present? && category.present?
      logger.info 'Account and category'.upcase
      return joins(:account).where('accounts.user_id = ? AND discarded_at IS NULL', user).
             where(account: account, category: category)      
    end
    # Account and date_range
    if user.present? && account.present? && date_range.present?
      logger.info 'Account with range_date'.upcase
      return joins(:account).where('accounts.user_id = ? AND discarded_at IS NULL', user).
             where(account: account, done_at: begin_date..end_date)      
    end
    # Category and date_range
    if user.present? && category.present? && date_range.present?
      logger.info 'Category with range_date'.upcase
      return joins(:account).where('accounts.user_id = ? AND discarded_at IS NULL', user).
             where(category: category, done_at: begin_date..end_date)      
    end                
    # Only account
    if user.present? && account.present?
      logger.info 'Only account'.upcase
      return joins(:account).where('accounts.user_id = ? AND discarded_at IS NULL', user).
            where(account: account)      
    end            
    # Only category
    if user.present? && category.present?
      logger.info 'Only category'.upcase
      return joins(:account).where('accounts.user_id = ? AND discarded_at IS NULL', user).
             where(category: category)      
    end
    # Only date_range
    if user.present? && date_range.present?
      logger.info 'Only date_range'.upcase
      return joins(:account).where('accounts.user_id = ? AND discarded_at IS NULL', user).
             where(done_at: begin_date..end_date)      
    end
    # All user transactions
    logger.info 'All user transactions'.upcase
    joins(:account).where('accounts.user_id = ? AND discarded_at IS NULL', user) 
  end

  def self.group_by_categories(user, year)
    categories_and_percentages = {}
    total_year_expense = 0.0  
    user.accounts.each do |account|
      total_year_expense += account.money_transactions.where('kind = ? AND extract(year from done_at) = ?', MoneyTransaction.kinds[:withdrawal], year).sum(:amount)
    end
    user.categories.where(associated_transaction_type: 'withdrawal').each do |category|
      total_year_category_expense = category.money_transactions.where('extract(year from done_at) = ?', year).sum(:amount)
      categories_and_percentages[category.name] = ((total_year_category_expense/total_year_expense)*100.0).round(2)
    end
    return categories_and_percentages
  end

  def update_account_balance
    accounts = self.account.user.accounts
    accounts.each do |account|
      new_account_balance = 0.0
      account.money_transactions.each do |mt|
        case mt.kind
        when 'deposit'
          new_account_balance += mt.amount
        when 'withdrawal'
          new_account_balance -= mt.amount
        end
      end
      account.update(current_balance: new_account_balance)
    end
  end

  def self.to_csv(records)
    require 'csv'
    money_transactions = records.order('done_at asc')
    CSV.generate(headers: true, encoding: 'utf-8') do |csv|
      csv << ['date', 'description', 'amount', 'type', 'category']
      money_transactions.each do |mt|
        csv << [mt.done_at, mt.description, mt.amount, mt.kind, mt.category.name]
      end
    end    
  end  
end
