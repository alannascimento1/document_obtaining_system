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
end
