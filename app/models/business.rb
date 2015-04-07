class Business < ActiveRecord::Base

  belongs_to :account_owner, class_name: 'User'
  has_many :business_users, dependent: :destroy
  has_many :users, :through => :business_users 

  accepts_nested_attributes_for :account_owner

  validates :account_owner, :business_name, presence: true
end