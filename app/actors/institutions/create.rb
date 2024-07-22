# frozen_string_literal: true

module Institutions
  class Create < Actor
    input :attributes

    def call
      institution = Institution.create(institution_params)
      fail!(error: :create_institution) unless institution.valid?

      required_document_types_requireds.each do |document_type|
        document_type = DocumentType.find_by(id: document_type)
        required_document_type = RequiredDocumentsInstitution.create(institution:, document_type:)

        next if required_document_type.valid?

        institution.required_documents_institutions.destroy_all
        institution.destroy
        fail!(error: :error_in_creating_required_document_types)
      end
    end

    private

    def institution_params
      attributes.slice(:name, :sector_id)
    end

    def required_document_types_requireds
      attributes[:document_type_ids]
    end
  end
end
