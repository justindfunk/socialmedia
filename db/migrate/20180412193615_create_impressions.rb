class CreateImpressions < ActiveRecord::Migration[5.1]
  def change
    create_table :impressions do |t|
      t.references :user, foreign_key: true
      t.references :hook, foreign_key: true
      t.datetime :start
      t.datetime :end

      t.timestamps
    end
  end
end
