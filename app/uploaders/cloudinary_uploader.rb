class CloudinaryUploader < CarrierWave::Uploader::Base
  include CarrierWave::Compatibility::Paperclip
  include Cloudinary::CarrierWave

  # Spree looks in attachment#errors, so just delegate to model#errors
  delegate :errors, to: :model

  # Match the path defined in Spree::Image
  def paperclip_path
    "assets/products/:id/:style/:basename.:extension"
  end

  # These are the versions defined in Spree::Image

  version :large do
    process resize_to_fill: [736, 490]
  end

  version :big, from_version: :large do
    process resize_to_fit: [600, 600]
  end

  version :product, from_version: :big do
    process resize_to_fit: [240, 240]
  end

  version :standard, from_version: :product do
    process resize_to_fill: [250, 166, :north]
  end

  version :post_thumb, from_version: :product do
    process resize_to_fill: [190, 150, :north]
  end

  version :post_thumb_small, from_version: :post_thumb do
    process resize_to_fill: [150, 95, :north]
  end

  version :small, from_version: :post_thumb do
    process resize_to_fit: [100, 100]
  end

  version :mini, from_version: :small do
    process resize_to_fit: [48, 48]
  end
end
