class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :bike

  validates :date, presence: true
end
