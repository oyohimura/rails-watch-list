class BookmarksController < ApplicationController
  before_action :find_bookmark, only: %i[show destroy]

  def new
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
  end

  def create
    @bookmark = Bookmark.new(params_bookmark)
    @bookmark.list = List.find(params[:list_id])
    @bookmark.movie = Movie.find(params[:bookmark][:movie_id])
    if @bookmark.save
      redirect_to list_path(@bookmark.list)
    else
      @bookmark = Bookmark.new
      render :new, status: :unprocessable_entity
    end
  end

  def show; end

  def destroy
    @bookmark.destroy
    redirect_to list_path(@bookmark.list), status: :see_other
  end

  private

  def params_bookmark
    params.require(:bookmark).permit(:comment)
  end

  def find_bookmark
    @bookmark = Bookmark.find(params[:id])
  end
end
