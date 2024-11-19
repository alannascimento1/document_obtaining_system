class AddAllowsMultipleToDocumentTypes < ActiveRecord::Migration[7.1]
  def change
    add_column :document_types, :allows_multiple, :boolean, default: false, null: false
  end
end
