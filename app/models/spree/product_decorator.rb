Spree::Product.class_eval do
  mount_uploader :doc, CloudinaryUploader
end
