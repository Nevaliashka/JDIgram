class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :image, presence: {message: "введите пробег между заправками"}
  belongs_to :account

  before_create :set_active

  scope :active, -> { where active: true }


  def set_active
    self.active = true
  end
end
