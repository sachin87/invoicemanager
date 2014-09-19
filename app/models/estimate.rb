class Estimate < ActiveRecord::Base

  attr_reader :receiver_tokens

  belongs_to :user
  has_many :items, as: :itemeable
  belongs_to :receiver, class_name: 'Client'

  validates :summary, :estimate_number, :date, presence: true
  validates :estimate_number, uniqueness: true

  accepts_nested_attributes_for :items, allow_destroy: true

  before_save :set_amount

  def receiver_tokens=(tokens)
    self.receiver_id = Client.ids_from_tokens(tokens).first
  end

  def receiver_full_name
    receiver && receiver.full_name
  end

  def sender_full_name
    user && user.full_name
  end

  def set_amount
    self.amount = items.sum(:amount)
  end

end
