class Item < ActiveRecord::Base

  attr_reader :estimate_category_tokens, :invoice_category_tokens, :bill_category_tokens

  belongs_to :itemeable, polymorphic: true

  def estimate_category_tokens=(tokens)
    self.description = Category.ids_from_tokens(tokens)
  end

  def invoice_category_tokens=(tokens)
    self.description = Category.ids_from_tokens(tokens)
  end

  def bill_category_tokens=(tokens)
    self.description = Category.ids_from_tokens(tokens)
  end

end
