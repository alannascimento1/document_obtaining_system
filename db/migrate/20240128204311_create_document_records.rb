class CreateDocumentRecords < ActiveRecord::Migration[7.1]
  def change
    create_table :document_records do |t|
      t.references :user, null: false, foreign_key: true
      t.references :institution, null: false, foreign_key: true
      t.boolean :state, default: true
      t.text :information
      t.references :document_type, null: false, foreign_key: true
      t.text :received_from

      t.timestamps
    end
  end
end
