class Invoice < ActiveRecord::Base

  belongs_to :user
  has_many :items, as: :itemeable
  belongs_to :receiver, class_name: 'User'

  validates :summary, :invoice_number, :date, presence: true
  validates :invoice_number, uniqueness: true

  accepts_nested_attributes_for :items, allow_destroy: true

end