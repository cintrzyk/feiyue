Spree::Image.class_eval do
  mount_uploader :attachment, CloudinaryUploader, mount_on: :attachment_file_name

  # Get rid of the paperclip callbacks
  def save_attached_files; end
  def prepare_for_destroy; end
  def destroy_attached_files; end

  # Get rid of Paperclip validation
  def attachment_file_name
    "image"
  end

  def file_name
    attributes['attachment_file_name'].split('/')[1]
  end
end
