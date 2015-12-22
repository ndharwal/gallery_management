class Image < ActiveRecord::Base
  has_many :comments, as: :commentable, :dependent => :destroy
  acts_as_votable
  belongs_to :album  
  belongs_to :user
  validates :img_name, presence: true
  mount_uploader :photo, PhotoUploader
  scope :sort, -> { order(:created_at => :DESC ) }

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end
end

    