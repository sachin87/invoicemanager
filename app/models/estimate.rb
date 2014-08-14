class Estimate < ActiveRecord::Base

  belongs_to :user
  has_many :items, as: :itemeable
  belongs_to :receiver, class_name: 'User'

  validates :summary, :bill_to, :bill_number, :date, presence: true

  accepts_nested_attributes_for :items, allow_destroy: true

end
