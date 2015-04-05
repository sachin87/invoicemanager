class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable, :omniauthable

  has_many :business_users, dependent: :destroy
  has_many :businesses, :through => :business_users
  has_many :invoices
  has_many :bills
  has_many :estimates
  has_many :tickets
  has_many :entries
  has_many :tasks
  has_many :teams_users
  has_many :teams, through: :teams_users
  has_many :supports

  validates :first_name, presence: true

  mount_uploader :company_logo, CompanyLogoUploader

  def full_name
    [first_name, last_name].compact.join(' ')
  end

  def complete_address
    [street1, street2, city, state, zipcode].join(' ')
  end

  def has_logo?
    company_logo.present?
  end

end
