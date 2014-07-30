class Invoice < ActiveRecord::Base

  belongs_to :user
  has_many :items, as: :itemeable
  belongs_to :receiver_id, class_name: 'User'

  accepts_nested_attributes_for :items, allow_destroy: true

end