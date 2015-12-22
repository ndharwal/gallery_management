class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true
  belongs_to :user
  validates :comment, presence: true
  scope :get_comment, -> (commentable) {  where(:commentable_id => commentable)}
  scope :find_inactive_comments, -> {  where(:active => false)}
  scope :get_active_comment, -> { where(:active => true) }
  scope :get_all_inactive_comments, -> (all_comments_id) { where(:commentable_id => all_comments_id, :commentable_type => "Album").find_inactive_comments}    
end
