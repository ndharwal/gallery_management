class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true
  validates :comment, presence: true
  scope :get_comment, -> (commentable) {  where(:commentable_id => commentable)}
  scope :find_inactive_comments, -> {  where(:active => false)}
  scope :get_active_comment, -> { where(:active => true) }
end
