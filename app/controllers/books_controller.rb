class BooksController < ApplicationController

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id)
    else
      @books=Book.all
      flash.now[:notice] = "Book was error create."
      render :index

    end
    # １.&2. データを受け取り新規登録するためのインスタンス作成

  end

  def index
    @books = Book.all
    @book=Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])

   if @book.update(book_params)
     flash[:notice] = "Book was successfully update."
      redirect_to book_path(@book.id)
   else
     flash.now[:notice] = "Book was error update ."
     render 'edit'
   end
  end

  def destroy
    book = Book.find(params[:id])  # データ（レコード）を1件取得
    book.destroy# データ（レコード）を削除
    redirect_to '/books'# 投稿一覧画面へリダイレクト
  end
  # def destroy
  #   @book = Book.find(params[:id])
  #   @book.destroy
  #   redirect_to '/books'
  # end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
