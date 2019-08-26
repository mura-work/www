class BooksController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @books = Book.order(favorites_count: "DESC").page(params[:page])
    @book = Book.find_by(params[:book_id])
    @favorites = Favorite.where(user_id: session[:user_id], book_id: @book.id)
    @comment = BookComment.where(params[:book_id])
    if params[:tag]
      @books = Book.tagged_with(params[:tag]).page(params[:page])
      @comment = BookComment.where(params[:book_id])
    else
      @books = Book.order(favorites_count: "DESC").page(params[:page])
      @comment = BookComment.where(params[:book_id])
    end
  end

  def top
    @books = Book.order(created_at: "DESC").page(params[:page])
    @book = Book.find_by(params[:book_id])
    @favorites = Favorite.where(user_id: session[:user_id], book_id: @book.id)
    @comment = BookComment.where(params[:book_id])
    if params[:tag]
      @books = Book.tagged_with(params[:tag]).page(params[:page])
      @comment = BookComment.where(params[:book_id])
    else
      @books = Book.order(created_at: "DESC").page(params[:page])
      @comment = BookComment.where(params[:book_id])
    end
  end

  def search
      @books = Book.where("person_name = ?", params[:person_name]).page(params[:page])
      @bookd = Book.find_by("person_name = ?", params[:person_name])
      render :index, locals: { bookd: @bookd }
  end

  def new
    @book_new = Book.new
  end

  def create
  	@book_new = Book.new(book_params)
	@book_new.user_id = current_user.id
     if  @book_new.save
        flash[:notice] = "質問を作成しました"
  	redirect_to books_path
	notifier = Slack::Notifier.new("https://hooks.slack.com/services/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")
	notifier.ping("質問が投稿されました！！GSの回答をお待ちください。")
    else
        @book_new = Book.new(book_params)
        render "new"
    end
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @book_comment = BookComment.new
    @comment = BookComment.where(params[:book_id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private
  def book_params
  	params.require(:book).permit(:body, :person_name, :tag_list)
  end

  def search_params
    params.require(:q).permit(:person_name)
  end

end




