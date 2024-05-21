class Institution < ApplicationRecord
  self.per_page = 5

  belongs_to :sector
  has_many :document_records

  validates :name, presence: true, uniqueness: true
end
