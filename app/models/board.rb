class Board < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_many :pins
  belongs_to :user

  validates :title, presence: true
end
