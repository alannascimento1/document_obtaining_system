class Institution < ApplicationRecord
  self.per_page = 5

  belongs_to :sector
  has_many :document_records
  has_many :required_documents_institutions

  validates :name, presence: true, uniqueness: true

  def required?(document_type)
    document_records.where(document_type:).exists?
  end

  def exists_required_document_type?(document_type)
    required_documents_institutions.where(document_type: document_type).exists?
  end

  def documents_not_registered_to_month(date:)
    required_documents_institutions.pluck(:document_type_id) - document_records.where(reference_date: date.beginning_of_month..date.end_of_month).pluck(:document_type_id)
    DocumentType.where(id: document_type_ids)
  end
end
