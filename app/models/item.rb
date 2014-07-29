class Item < ActiveRecord::Base

  belongs_to :itemeable, polymorphic: true

end
