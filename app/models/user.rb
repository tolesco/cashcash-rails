class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  before_save :upcase_extra_params
  after_commit :create_default_categories_and_accounts, on: :create
  has_many :accounts, dependent: :destroy
  has_many :categories, dependent: :destroy
  validates_uniqueness_of :sat_rfc, case_sensitive: false

  def current_net_income
    return Account.where('user_id = ? AND discarded_at IS NULL', self).sum(:current_balance)
  end

  def create_default_categories_and_accounts
    Category.create(name: 'Uncategorized income',  associated_transaction_type: 'deposit',    user: self, immortal: true)
    Category.create(name: 'Uncategorized expense', associated_transaction_type: 'withdrawal', user: self, immortal: true)
    Account.create(name: 'Cash', kind: 'cash_and_bank', current_balance: 0.0, user: self)
  end

  private

  def upcase_extra_params
    self.sat_name.try(:upcase)
    self.sat_rfc.try(:upcase)
  end
end
