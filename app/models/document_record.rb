class DocumentRecord < ActiveRecord::Base
  belongs_to :user
  belongs_to :institution
  belongs_to :document_type
end
