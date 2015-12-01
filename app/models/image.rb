class Image < ActiveRecord::Base
  has_many :comments, as: :commentable, :dependent => :destroy
  belongs_to :album  
  validates :img_name, presence: true
  mount_uploader :photo, PhotoUploader
end
