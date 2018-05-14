class User < ApplicationRecord
  has_many :bikes
  has_many :reservations
end
