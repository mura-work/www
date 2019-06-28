class Book < ApplicationRecord
	belongs_to :user, foreign_key: "person_id"
	has_many :book_comments, dependent: :destroy
	has_many :favorites, dependent: :destroy
	has_many :favoriting_users, through: :favorites, source: :user

	validates :person_id, presence:true
	validates :body, presence:true

	default_scope -> { order(created_at: :desc) }

	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end
end
