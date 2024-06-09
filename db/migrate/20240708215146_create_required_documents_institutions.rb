class CreateRequiredDocumentsInstitutions < ActiveRecord::Migration[7.1]
  def change
    create_table :required_documents_institutions do |t|
      t.references :institution, null: false, foreign_key: true
      t.references :document_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
