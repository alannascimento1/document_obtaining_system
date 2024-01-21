class Sector < ApplicationRecord
  # name is unique
  validates :name, presence: true, uniqueness: true

  has_many :institutions

  validates :name, presence: true, uniqueness: true
end
