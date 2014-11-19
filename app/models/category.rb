class Category < ActiveRecord::Base

  has_many :items

  def self.tokens(query)
    where("name like ?", "%#{query}%").map do |category|
      {id: category.id,
       name: category.name_with_description,
       unit_price: category.unit_price,
       quantity: category.unit,
       amount: category.unit_price * category.unit.to_i }
    end
  end

  def self.ids_from_tokens(tokens)
    tokens.gsub!(/<<<(.+?)>>>/) { create!(name: $1).id }
    tokens.split(',')
  end

  def name_with_description
    [name, description].join(':')
  end

end
