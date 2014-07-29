class Invoice < ActiveRecord::Base

  INVOICE_DUE = [['Due on Receipt',''], ['After 15 days',15], ['After 30 days', 30], ['After 45 days', 45],
                 ['After 60 days', 60], ['Custom', -1]]

  belongs_to :user
  has_many :items, as: :itemeable

  accepts_nested_attributes_for :item

end