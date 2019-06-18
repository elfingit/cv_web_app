class Portfolio < ApplicationRecord
  has_and_belongs_to_many :technologies
  has_one_attached :preview

  validate :preview_validation

  validates :title, :description, :presence => true
  validates :url, :format => { :with => URI::regexp(%w(http https)) }

  def preview_validation
    if preview.attached?
      if !preview.blob.content_type.eql?('image/jpeg') && !preview.blob.content_type.eql?('image/png')
        preview.purge
        errors[:base] << 'Preview wrong format'
      elsif preview.blob.byte_size > 1000000
        preview.purge
        errors[:base] << 'Preview too big'
      end
    end
  end

end
