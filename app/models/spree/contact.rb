class Spree::Contact < ActiveRecord::Base
  after_create :send_confirmation
  after_create :send_reminder

  phony_normalize :phone
  validates_plausible_phone :phone, presence: true

  validates :orientation, inclusion: { in: %w(south north west east) }, allow_blank: true
  validates :roof, inclusion: { in: %w(flat tiled other) }, allow_blank: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }, presence: true
  validates :name, :address, :question, presence: true
  validates :asize, :bsize, :csize, :dsize, :esize, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 80 }
  validates :size, numericality: { greater_than_or_equal_to: 1000, less_than_or_equal_to: 15000, only_integer: true }

  private

  def send_confirmation
    Spree::UserMailer.confirm_contact(self).deliver!
  end

  def send_reminder
    Spree::UserMailer.remind_contact(self).deliver!
  end
end
