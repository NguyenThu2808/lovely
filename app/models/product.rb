class Product < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

  validates :name, :slug, presence: true, uniqueness: true

  # def to_param
  #   "#{slug}-#{id}"
  # end
  has_many :cart_items, dependent: :destroy
  has_many :product_colors, dependent: :destroy

  def should_generate_new_friendly_id?
    name_changed? || super
  end
end
