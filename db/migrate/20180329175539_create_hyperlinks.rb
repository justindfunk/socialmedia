class CreateHyperlinks < ActiveRecord::Migration[5.1]
  def change
    create_table :hyperlinks do |t|
      t.references :hook, foreign_key: true
      t.string :url
      t.string :title
      t.string :description
      t.string :image

      t.timestamps
    end
  end
end
