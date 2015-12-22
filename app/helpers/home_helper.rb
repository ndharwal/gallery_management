module HomeHelper

  def comment_author_name(user_id)
    user = User.where(:id => user_id).first.decorate.full_name
  end
end
