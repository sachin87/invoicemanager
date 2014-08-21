class Invoice < ActiveRecord::Base

  attr_reader :receiver_tokens

  belongs_to :user
  has_many :items, as: :itemeable
  belongs_to :receiver, class_name: 'Client'

  validates :summary, :invoice_number, :date, presence: true
  validates :invoice_number, uniqueness: true

  accepts_nested_attributes_for :items, allow_destroy: true


  def receiver_tokens=(tokens)
    self.author_ids = Author.ids_from_tokens(tokens)
  end

end