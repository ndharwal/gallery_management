module AlbumsConcern
  extend ActiveSupport::Concern

	def like_action(like_params_value)
		like_params_value.upvote_by current_user
		respond_to do |format|
	  	format.js {}
	  	format.html {}
		end
	end
  def unlike_action(unlike_params_value)
    unlike_params_value.downvote_by current_user
    respond_to do |format|
      format.js {}
      format.html {}
    end
  end
end