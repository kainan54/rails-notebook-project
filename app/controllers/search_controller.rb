class SearchController < ApplicationController

    def search_users_and_note_books
        @users = User.filter_by_username(params[:query])
        @note_books = NoteBook.filter_by_title(params[:query])
    end
end
