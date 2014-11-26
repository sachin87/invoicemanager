class Invoice < ActiveRecord::Base

  attr_reader :receiver_tokens

  belongs_to :user
  has_many :items, as: :itemeable
  has_many :categories, through: :items
  belongs_to :receiver, class_name: 'Client'

  validates :summary, :invoice_number, :date, :state, presence: true
  validates :invoice_number, uniqueness: true

  accepts_nested_attributes_for :items, allow_destroy: true

  before_save :set_amount

  state_machine initial: :draft do
    event :mail do
      transition [:draft, :duplicated] => :mailed
    end

    event :delete do
      transition [:draft, :duplicated, :closed] => :deleted
    end

    event :mark_as_sent do
      transition [:draft, :duplicated] => :mailed
    end

    event :duplicate do
      transition [:draft, :closed] => :duplicated
    end

    event :close do
      transition :draft => :closed
    end

  end

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