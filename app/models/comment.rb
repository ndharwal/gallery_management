class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true
  validates :comment, presence: true
  scope :get_comment, -> (commentable) {  where(:commentable_id => commentable)}

end
