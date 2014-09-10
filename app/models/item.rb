class Item < ActiveRecord::Base

  attr_reader :estimate_category_tokens, :invoice_category_tokens, :bill_category_tokens

  belongs_to :itemeable, polymorphic: true
  belongs_to :category

  def estimate_category_tokens=(tokens)
    self.category_id = Category.ids_from_tokens(tokens).first
  end

  def invoice_category_tokens=(tokens)
    self.category_id = Category.ids_from_tokens(tokens)
  end

  def bill_category_tokens=(tokens)
    self.category_id = Category.ids_from_tokens(tokens)
  end

end
