module HomeHelper

  def comment_author_name(comm)
    user = User.where(:id => comm).first
  end
end
