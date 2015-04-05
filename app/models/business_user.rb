class BusinessUser < ActiveRecord::Base

  belongs_to :user
  belongs_to :business

  validates :first_name, :email, :role, presence: true
end