# frozen_string_literal: true

class RequiredDocumentsInstitution < ApplicationRecord
  belongs_to :institution
  belongs_to :document_type

  validates :name, presence: true
  validates :description, presence: true
  validates :status, presence: true
end
