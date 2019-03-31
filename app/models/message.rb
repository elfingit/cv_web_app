class Message < ApplicationRecord
  validates :email, :message, :presence => true
  validates :name, :length => { :minimum => 2, :maximum => 255 }
  validates :message, :length => { :minimum => 3, :maximum => 65535 }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

end
