class BookmarksController < ApplicationController

  def index
    @bookmarks = Bookmark.all
  end

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    if @bookmark.save
      redirect_to url_for(bookmarks_path)
    else
      render 'new'
    end
  end

  def show
    @bookmark = Bookmark.find(params[:id])
  end

  def edit
    @bookmark = Bookmark.find(params[:id])
  end

  def update
    @bookmark = Bookmark.find(params[:id])

    if @bookmark.update(bookmark_params)
      redirect_to url_for(bookmarks_path)
    else
      render 'edit'
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy

    redirect_to url_for(bookmarks_path)
  end

  private
    def bookmark_params
      params.require(:bookmark).permit(:title, :link, :summary)
    end

end
