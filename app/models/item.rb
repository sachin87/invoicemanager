class Item < ActiveRecord::Base

  attr_reader :category_tokens

  belongs_to :itemeable, polymorphic: true

  def category_tokens=(tokens)
    self.description = Category.ids_from_tokens(tokens)
  end

end
