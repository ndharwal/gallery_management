module ImagesHelper
  
  def limitcomment(image)
    comment_page = image.comments.where(:commentable_id => image.id).limit(5)
  end
end
