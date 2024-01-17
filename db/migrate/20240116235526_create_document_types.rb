class CreateDocumentTypes < ActiveRecord::Migration[7.1]
  def change
    create_table :document_types do |t|
      t.text :name
      t.text :information
      t.references :user, null: false, foreign_key: true
      t.references :institution, null: false, foreign_key: true
      t.text :state

      t.timestamps
    end
  end
end
