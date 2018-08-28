class BooksController < ApplicationController
	def new
  		
  	end

	def index
		@books = Book.all
		@book = Book.new
		@user = current_user
	end


	def create
		@book = Book.new(book_params)

		@book.user_id = current_user.id

		if @book.save
      		redirect_to book_path(@book.id), :notice =>"Book was successfully created"
      	else
      		@books= Book.all
			@user = current_user
      		render :index
      	end
	end

	def show
		@book = Book.new
		@bookf = Book.find(params[:id])
		@user = @bookf.user
		# @user = User.find(params[:id])
	end

	def edit
		@book = Book.find(params[:id])
		@user = @book.user
		if @book.user_id != current_user.id
		redirect_to book_path(@book)
		end
	end

	def update
		book = Book.find(params[:id])
    	book.update(book_params)
    	redirect_to book_path(book.id)
	end

	def destroy
		book = Book.find(params[:id])
    	book.destroy
    	redirect_to user_path(book.user.id)
	end


	private

    def book_params
        params.require(:book).permit(:title, :opinion,)
    end
end
