class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :participations
  has_many :ownerships
  has_many :articles, -> { where type: 'Article' }, through: :ownerships, source: :hook
  has_many :profiles, through: :ownerships, source: :hook

  has_many :interests
  has_many :hooks, through: :interests

  has_many :impressions
  has_many :views
  has_many :glances

  has_many :seens, through: :impressions, source: :hook
  has_many :viewed_hooks, through: :views, source: :hook


  def profile
    profiles.first
  end

  def feed
    self.articles
  end

end
