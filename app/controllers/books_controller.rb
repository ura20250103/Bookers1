class BooksController < ApplicationController
      def new
         @book = Book.new
    end
    
    # 以下を追加
    def create
        # ストロングパラメーターを使用
         book = Book.new(list_params)
        # DBへ保存する
         book.save
        # トップ画面へリダイレクト
        redirect_to books_path(book.id) # 詳細画面へリダイレクト
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
        redirect_to books_path(book.id)
    end
    def destroy
    	book = Book.find(params[:id]) #データ(レコード)を1件取得
        book.destroy #データ（レコード）を削除
        redirect_to books_path #List一覧画面へリダイレクト
    end

    private
   
    def book_params
        params.require(:book).permit(:title, :body)
    end
 
end
