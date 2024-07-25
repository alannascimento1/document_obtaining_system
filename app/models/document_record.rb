class DocumentRecord < ActiveRecord::Base
  belongs_to :user
  belongs_to :institution
  belongs_to :document_type

  validates :reference_date, uniqueness: { scope: [:institution_id, :document_type_id] }

  PENDING = "pending"
  DELIVERED = "delivered"
end
