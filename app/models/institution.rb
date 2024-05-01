class Institution < ApplicationRecord
  belongs_to :sector
  has_many :document_records

  validates :name, presence: true, uniqueness: true
end
