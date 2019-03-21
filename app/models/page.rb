class Page < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  validates :title, :description, :body, :presence => true
  validates :title, :length => { :minimum => 3, :maximum => 255 }
  validates :body, :length => { :minimum => 3, :maximum => 65535 }
  validates :description, :length => { :minimum => 3, :maximum => 255 }

  include PageAdmin

end
