class Image < ActiveRecord::Base
  belongs_to :album
  validates :img_name, presence: true
  mount_uploader :photo, PhotoUploader
end
