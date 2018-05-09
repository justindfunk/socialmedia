class AddContentToHooks < ActiveRecord::Migration[5.1]
  def change
    add_column :hooks, :content, :text
  end
end
