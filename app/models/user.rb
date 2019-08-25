class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :sat_name, :sat_rfc, presence: true
  before_create :upcase_extra_params
  has_many :accounts, dependent: :destroy

  private

  def upcase_extra_params
    self.sat_name.upcase!
    self.sat_rfc.upcase!
  end
end
