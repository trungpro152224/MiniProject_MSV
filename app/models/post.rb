class Post < ApplicationRecord
	
	acts_as_votable

	belongs_to :user
	
	has_many :comments

  validates :description,
  presence: true,
  allow_blank: true

  validates :title,
  presence: true,
  allow_blank: true


	has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

end
