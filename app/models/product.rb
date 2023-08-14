class Product < ApplicationRecord
  # self.per_page = 10
  extend FriendlyId
  friendly_id :name, use: :slugged

  validates :name, :slug, presence: true, uniqueness: true
end
