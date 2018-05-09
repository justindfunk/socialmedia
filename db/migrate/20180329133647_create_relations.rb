class CreateRelations < ActiveRecord::Migration[5.1]
  def change
    create_table :relations do |t|
      t.string :type
      t.references :hook, foreign_key: true
      t.references :child,  foreign_key: { to_table: :hooks }

      t.timestamps
    end
  end
end
