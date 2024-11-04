# frozen_string_literal: true

class DocumentRecord::MarkAsDelivered < Actor
  input :document, type: DocumentRecord

  def call
    success = document.update(pendency: nil)
    fail!(error: :not_marked_as_delivered) unless success
  end
end
