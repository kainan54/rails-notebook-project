class SavedNoteBooksController < ApplicationController

    def toggle_likes
        if current_user.has_user_saved_note_book(params[:note_book_id])
            SavedNoteBookJoin.where(user_id: params[:user_id], note_book_id: params[:note_book_id])[0].destroy
        else
            SavedNoteBookJoin.create(user_id: params[:user_id], note_book_id: params[:note_book_id])
        end
    end

end
