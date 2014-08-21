class Client < ActiveRecord::Base

  def self.tokens(query)
    authors = where("first_name like ?", "%#{query}%")
    if authors.empty?
      [{id: "<<<#{query}>>>", first_name: "New: \"#{query}\""}]
    else
      authors
    end
  end

  def self.ids_from_tokens(tokens)
    tokens.gsub!(/<<<(.+?)>>>/) { create!(first_name: $1).id }
    tokens.split(',')
  end

end
