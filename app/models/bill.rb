class Bill < ActiveRecord::Base

  attr_reader :receiver_tokens

  belongs_to :user
  has_many :items, as: :itemeable
  belongs_to :receiver, class_name: 'Client'

  validates :summary, :bill_number, :date, presence: true
  validates :bill_number, uniqueness: true

  accepts_nested_attributes_for :items, allow_destroy: true

  def receiver_tokens=(tokens)
    self.receiver_id = Client.ids_from_tokens(tokens).first.to_i
  end

  def receiver_fullname
    receiver && receiver.full_name
  end

  def sender_fullname
    user && user.full_name
  end

end
