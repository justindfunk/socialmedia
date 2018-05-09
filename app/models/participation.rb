class Participation < ApplicationRecord
  belongs_to :user
  belongs_to :hook
end
