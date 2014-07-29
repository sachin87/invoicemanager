class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable, :omniauthable

  has_many :invoices
  has_many :bills
  has_many :estimates
  has_many :tickets
  has_many :entries
  has_many :tasks
  has_many :teams_users
  has_many :teams, through: :teams_users

end
