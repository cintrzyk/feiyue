class Spree::Post < ActiveRecord::Base
  has_many :images, as: :viewable, dependent: :destroy, class_name: "Spree::Image"

  scope :recents, -> { order("created_at DESC").limit(2) }

  validates_presence_of :title
  validates_presence_of :description
end
