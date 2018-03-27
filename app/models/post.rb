class Post < ApplicationRecord
	
	acts_as_votable

	belongs_to :user
	
	has_many :comments, dependent: :destroy 

  validates :description,
  presence: true

  validates :title,
  presence: true,
  length: { minimum: 5 }


  validates :image,
  presence: true


	has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  def self.search(search)

  where("title LIKE ?", "%#{search}%")
	end

end
