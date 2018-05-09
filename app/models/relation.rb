class Relation < ApplicationRecord
  belongs_to :hook
  belongs_to :child, foreign_key: 'child_id', class_name: 'Hook'
end
