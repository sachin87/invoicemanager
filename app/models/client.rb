class Client < ActiveRecord::Base

  has_one :country
  has_one :currency

  def self.tokens(query)
    where("first_name like ?", "%#{query}%")
  end

  def self.ids_from_tokens(tokens)
    tokens.gsub!(/<<<(.+?)>>>/) { create!(first_name: $1).id }
    tokens.split(',')
  end

  def address
    [street_address, city, state, zipcode, country_id].join(',')
  end

  def name_with_address
    [full_name, address].join(':')
  end

  def full_name
    [first_name, last_name].join(' ')
  end

end
