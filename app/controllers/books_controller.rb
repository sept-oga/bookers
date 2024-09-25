class BooksController < ApplicationController
  def new

  end
  
  # インスタンス変数を使う時
  # ①新規投稿用に空のモデルを用意したい
  # ②投稿一覧を表示したい
  # ③詳細画面で対応するデータを表示したい
  # ローカル変数はデータのみを保存する処理をしたい時に使う

  def create
    @book = Book.new(book_params)
    if @book.save
      # flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id) #投稿が成功するとそのページへ行く
    else
      @books = Book.all
      render :index # indexの画面に行く
    end
  end

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
