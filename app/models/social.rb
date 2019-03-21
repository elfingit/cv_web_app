class Social < ApplicationRecord
  has_one_attached :icon

  validate :icon_validation

  def icon_validation
    if icon.attached?
      if !icon.blob.content_type.eql?('image/svg+xml')
        icon.purge
        errors[:base] << 'Icon wrong format'
      end
    end

  end
end
