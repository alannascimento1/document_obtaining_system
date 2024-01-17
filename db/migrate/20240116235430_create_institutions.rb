class CreateInstitutions < ActiveRecord::Migration[7.1]
  def change
    create_table :institutions do |t|
      t.text :name, null: false
      t.references :sector, null: false, foreign_key: true

      t.timestamps
    end
  end
end
