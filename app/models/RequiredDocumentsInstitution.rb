# frozen_string_literal: true

class RequiredDocumentsInstitution < ApplicationRecord
  belongs_to :institution
  belongs_to :document_type
end
