class BooksController < ApplicationController
  def index
    @books = Book.all
    #render json: Book.all
  end

  # because we updated our routes.rb, the #new and #create can be found!
  def new
    # just to direct us to the page with the form to add a book
    render :new
  end


  # our create action has access to the values submitted through the new book
  # form via the private book_params method provided for you in the BooksController

  def create
    # we are using a book object
    # and we call the create method, which i think we inherited from ApplicationController
    # and pass in the param saved below
    Book.create(book_params)
    redirect_to books_url
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy

    redirect_to books_url
  end

  private
  # this stops 'mass assignment'
  # the permit specficcialy says that it is okay tot change those things
  # everything else is off limits to users
  def book_params
    params.require(:book).permit(:title, :author)
  end
end
