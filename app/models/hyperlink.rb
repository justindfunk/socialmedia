class Hyperlink < ApplicationRecord
  belongs_to :hook, inverse_of: :hyperlinks
end
