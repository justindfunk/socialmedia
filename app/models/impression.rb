class Impression < ApplicationRecord
  belongs_to :user
  belongs_to :hook
end
