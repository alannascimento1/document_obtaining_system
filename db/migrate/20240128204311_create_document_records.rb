class CreateDocumentRecords < ActiveRecord::Migration[7.1]
  def change
    create_table :document_records do |t|
      t.text :information
      t.text :pendency
      t.text :received_from
      t.boolean :state, default: true
      t.date :reference_date, default: -> { 'CURRENT_DATE' }
      t.references :user, null: false, foreign_key: true
      t.references :institution, null: false, foreign_key: true
      t.references :document_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
