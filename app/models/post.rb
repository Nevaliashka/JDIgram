class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  default_scope { order created_at: :desc}
  validates :image, presence: {message: "Add some image"}
  belongs_to :account

  has_many :likes
  has_many :comments

  before_create :set_active

  scope :active, -> { where active: true }


  private

  def set_active
    self.active = true
  end
end
