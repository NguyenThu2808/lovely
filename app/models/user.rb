class User < ApplicationRecord
  has_secure_password

  has_many :cart_items, dependent: :destroy, foreign_key: 'session_id'
end
