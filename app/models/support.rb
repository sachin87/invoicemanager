class Support < ActiveRecord::Base

  belongs_to :user

  validates :subject, :message, :user_id, presence: true

end
