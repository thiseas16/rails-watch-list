class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:id])
    @bookmark = @list.bookmarks.new
  end

  def create
    @list = List.find(params[:id])
    @bookmark = @list.bookmarks.create(bookmark_params)
    redirect_to list_path(@list)
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @list = @bookmark.list
    @bookmark.destroy
    redirect_to list_path(@list)
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:movie_id, :comment)
  end
end
