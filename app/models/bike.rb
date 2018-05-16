class Bike < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :user
  has_many :reservations

  CATEGORIES = [
    "VTT",
    "VTC",
    "Tandem",
    "Rosalie",
    "Tricycle"
  ]

  validates :category, inclusion: { in: CATEGORIES }
  validates :description, presence: true
  validates :title, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
