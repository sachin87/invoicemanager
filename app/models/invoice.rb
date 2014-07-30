class Invoice < ActiveRecord::Base

  belongs_to :user
  has_many :items, as: :itemeable

  accepts_nested_attributes_for :items, allow_destroy: true

end