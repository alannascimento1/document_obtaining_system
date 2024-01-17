class Sector < ApplicationRecord
  has_many :institutions

  validates :name, presence: true, uniqueness: true
end
