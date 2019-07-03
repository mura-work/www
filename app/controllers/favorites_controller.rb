class FavoritesController < ApplicationController

	def index
		@favorites = Favorite.where(book_id: params[:id])
	end

	def create
		@book = Book.find(params[:book_id])
		favorite = current_user.favorites.build(book_id: params[:book_id])
		favorite.save
	end

	def destroy
		@book = Book.find(params[:book_id])
		favorite = current_user.favorites.find_by(book_id: book.id)
		favorite.destroy
	end

end
