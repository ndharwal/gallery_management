module AlbumsHelper

  def albumcoverpage(album)
    album.images.where(:id => album.cover_id).first
  end
end
