class Bike < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :user
  has_many :reservations
end
