class Technology < ApplicationRecord

  include TechnologyAdmin

  validates :title, :icon_url, :presence => true
  validates :icon_url, :format => { :with => URI::regexp(%w(http https)) }

end
