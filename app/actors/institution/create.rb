# frozen_string_literal: true

module Institution
  class Create < Actor
    input :attributes

    def call
      institution = Institution.create(institution_params)
      required_document_types_requireds.each do |document_type|
        document_type = DocumentType.find_by(id: document_type)
        required_document_type = RequiredDocumentsInstitution.create(institution:, document_type:)

        unless required_document_type.valid?
          institution.required_documents_institutions.destroy_all
          institution.destroy
          fail!(:error_in_creating_required_document_types)
        end
      end
    end

    private
    def institution_params
      attributes.slice(:name, :sector_id)
    end

    def required_document_types_requireds
      attributes.slice(:document_type_ids)
    end
  end
end
