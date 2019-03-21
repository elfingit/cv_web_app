class Social < ApplicationRecord
  has_one_attached :icon

  validate :icon_validation
  validates :title, :url, :icon, :presence => true
  validates :url, :format => { :with => URI::regexp(%w(http https)) }

  def icon_validation
    if icon.attached?
      if !icon.blob.content_type.eql?('image/svg+xml')
        icon.purge
        errors[:base] << 'Icon wrong format'
      end
    end

  end
end
