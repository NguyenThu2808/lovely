class CartItem < ApplicationRecord
  belongs_to :product
  belongs_to :user, foreign_key: 'session_id'
end
