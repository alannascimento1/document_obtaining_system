# frozen_string_literal: true

class DocumentType < ApplicationRecord
  has_many :required_documents_institutions
end
