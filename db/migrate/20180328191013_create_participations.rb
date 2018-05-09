class CreateParticipations < ActiveRecord::Migration[5.1]
  def change
    create_table :participations do |t|
      t.references :user, foreign_key: true
      t.references :hook, foreign_key: true
      t.string :type

      t.timestamps
    end
  end
end
