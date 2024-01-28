class Sector < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :institutions

  validates :name, presence: true, uniqueness: true
end
