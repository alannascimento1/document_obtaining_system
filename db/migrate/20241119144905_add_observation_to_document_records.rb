class AddObservationToDocumentRecords < ActiveRecord::Migration[7.1]
  def change
    add_column :document_records, :observation, :text
  end
end
