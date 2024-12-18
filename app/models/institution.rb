class Institution < ApplicationRecord
  self.per_page = 5
  require 'csv'

  belongs_to :sector
  has_many :document_records
  has_many :required_documents_institutions

  validates :name, presence: true, uniqueness: true

  def exists_required_document_type?(document_type)
    required_documents_institutions.where(document_type: document_type).exists?
  end

  def documents_not_registered_to_month(date:)
    document_type_ids = required_documents_institutions.pluck(:document_type_id) - document_records.where(reference_date: date.beginning_of_month..date.end_of_month).pluck(:document_type_id)
    DocumentType.where(id: document_type_ids)
  end

  def documents_with_pendency_to_month(date:)
    document_records.where.not(pendency: nil).where.not(pendency: "").where(reference_date: date.beginning_of_month..date.end_of_month)
  end

  def documents_registered_to_month(date:)
    document_type_ids = document_records.where(reference_date: date.beginning_of_month..date.end_of_month).pluck(:document_type_id)
    DocumentType.where(id: document_type_ids)
  end

  def fetch_by_status_and_date(status:, date:)
    if status == DocumentRecord::PENDING
      documents_not_registered_to_month(date:)
    elsif status == DocumentRecord::DELIVERED
      documents_registered_to_month(date:)
    end
  end

  def self.to_csv
    ::CSV.generate(headers: true) do |csv|
      csv << ["Instituição", "Documento", "Mês de Referência"]

      all.includes(:document_records).each do |institution|
        institution.document_records.each do |document|
          csv << [
            institution.name,
            DocumentType.find(document.document_type_id).name,
            document.reference_date.strftime("%Y-%m")
          ]
        end
      end
    end
  end
end
