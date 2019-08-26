class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  before_create :upcase_extra_params
  has_many :accounts, dependent: :destroy
  has_many :categories, dependent: :destroy
  validates :sat_name, :sat_rfc, presence: true
  validates_uniqueness_of :sat_rfc, case_sensitive: false

  def current_net_income
    5000.0
  end

  private

  def upcase_extra_params
    self.sat_name.upcase!
    self.sat_rfc.upcase!
  end
end
