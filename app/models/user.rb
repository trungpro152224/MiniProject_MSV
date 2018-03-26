class User < ApplicationRecord
  
  acts_as_voter

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessor :username

  has_many :posts

  has_many :comments, dependent: :destroy 

end
