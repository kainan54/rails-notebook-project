class HomeController < ApplicationController
  def index
    # reverse later
    redirect_to note_books_browse_path(page: 0) if current_user
  end
end
