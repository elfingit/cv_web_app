class Technology < ApplicationRecord
  include TechnologyAdmin

  has_and_belongs_to_many :portfolios

  validates :title, :icon_url, :presence => false
  validates :icon_url, :format => { :with => URI::regexp(%w(http https)) }
  
end
