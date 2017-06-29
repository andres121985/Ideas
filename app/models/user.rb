class User < ActiveRecord::Base
  has_secure_password

  has_many :ideas
  has_many :likes
  has_many :ideas_liked, through: :likes, source: :ideas

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :name, :alias, presence: true
  validates :email, presence: true, uniqueness: true, format: {with: EMAIL_REGEX}

end
