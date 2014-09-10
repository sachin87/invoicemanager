class Category < ActiveRecord::Base

  has_many :items

  def self.tokens(query)
    where("name like ?", "%#{query}%")
  end

  def self.ids_from_tokens(tokens)
    tokens.gsub!(/<<<(.+?)>>>/) { create!(name: $1).id }
    tokens.split(',')
  end

end
