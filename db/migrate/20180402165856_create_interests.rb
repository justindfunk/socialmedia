class CreateInterests < ActiveRecord::Migration[5.1]
  def change
    create_table :interests do |t|
      t.references :user, foreign_key: true
      t.references :hook, foreign_key: true
      t.decimal :rating, :precision => 3, :scale => 2

      t.timestamps
    end
  end
end
