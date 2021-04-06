class NoteBooksController < ApplicationController
  before_action :set_note_book, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: %i[ new create edit update destroy ]

  # GET /note_books or /note_books.json
  def index
    @note_books = NoteBook.all
  end

  # GET /note_books/1 or /note_books/1.json
  def show
  end

  # GET /note_books/new
  def new
    @note_book = NoteBook.new
    @note_book.sections.build
  end

  # GET /note_books/1/edit
  def edit
  end

  # POST /note_books or /note_books.json
  def create
    @note_book = NoteBook.new(note_book_params)

    respond_to do |format|
      if @note_book.save
        format.html { redirect_to @note_book, notice: "Note book was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /note_books/1 or /note_books/1.json
  def update
    respond_to do |format|
      if @note_book.update(note_book_params)
        format.html { redirect_to @note_book, notice: "Note book was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /note_books/1 or /note_books/1.json
  def destroy
    @note_book.sections.destroy
    @note_book.destroy
    respond_to do |format|
      format.html { redirect_to note_books_url, notice: "Note book was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note_book
      @note_book = NoteBook.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def note_book_params
      params.require(:note_book).permit(:title, sections_attributes: [:title])
    end
end
