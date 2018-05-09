class Hook < ApplicationRecord
  has_many :relations

  has_and_belongs_to_many :hooks, join_table: 'relations', foreign_key: 'child_id', association_foreign_key: 'hook_id', class_name: 'Hook'

  has_many :posts, -> { where type: 'Article' }, through: :relations, source: :child
  has_many :tags, -> { where type: 'Tag' }, through: :relations, source: :child
  has_many :hyperlinks, inverse_of: :hook

  has_many :impressions
  has_many :views
  has_many :glances

  accepts_nested_attributes_for :hyperlinks, reject_if: proc { |attributes| attributes[:url].blank? }, allow_destroy: true

  accepts_nested_attributes_for :tags, reject_if: proc { |attributes| attributes[:name].blank? }, allow_destroy: true

  has_one :ownership, foreign_key: 'hook_id'

  def owner
    self.ownership.user
  end

  def title_label
    'Title'
  end

  def content_label
    'Content'
  end
end
