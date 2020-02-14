class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  default_scope { order created_at: :desc}
  validates :image, presence: {message: "Add some image"}
  belongs_to :account

  has_many :likes

  before_create :set_active

  scope :active, -> { where active: true }

  def total_likes
    0
  end


  private

  def set_active
    self.active = true
  end
end
