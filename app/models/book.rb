class Book < ApplicationRecord


	belongs_to :user
	has_many :book_comments, dependent: :destroy
	has_many :favorites, dependent: :destroy
	has_many :favorited_users, through: :favorites, source: :user


	validates :person_name, presence:true
	validates :body, presence:true
	validates :tag_list, presence:true

	default_scope { order(favorites_count: :desc,created_at: :DESC) }



	acts_as_taggable_on :labels
	acts_as_taggable

end

