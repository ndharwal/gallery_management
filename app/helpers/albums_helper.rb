module AlbumsHelper

  def albumcoverpage(album)
    album.images.where(:id => album.cover_id).first
  end

  def commentlimit(album)
    comment_page = album.comments.where(:commentable_id => album.id).limit(5)    
  end
end
