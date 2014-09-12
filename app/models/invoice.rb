class Invoice < ActiveRecord::Base

  attr_reader :receiver_tokens

  belongs_to :user
  has_many :items, as: :itemeable
  has_many :categories, through: :items
  belongs_to :receiver, class_name: 'Client'

  validates :summary, :invoice_number, :date, presence: true
  validates :invoice_number, uniqueness: true

  accepts_nested_attributes_for :items, allow_destroy: true

  before_save :set_amount

  def receiver_tokens=(tokens)
    self.receiver_id = Client.ids_from_tokens(tokens).first
  end

  def receiver_fullname
    receiver && receiver.full_name
  end

  def sender_fullname
    user && user.full_name
  end

  def set_amount
    self.amount = items.sum(:amount)
  end

end