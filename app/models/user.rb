class User < ApplicationRecord
  has_many :likes
  has_many :ideas
  has_secure_password
  validates :name, :alias, :password, presence: true
  validates :email, uniqueness: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
end
