module HomeHelper

  def image_count
    @counting = 0;
    @albums.each do |album|
      images = Image.all
      image  = images.where(:album_id => album.id)
      count_image  = image.count
      @counting = @counting + count_image
    end
  end
end
