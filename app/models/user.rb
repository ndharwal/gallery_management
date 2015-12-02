class User < ActiveRecord::Base
  has_many :albums
  validates :fname, :lname, :contact, presence: true
  validates :contact, length: { minimum: 10, maximum: 10 }, numericality: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  mount_uploader :profile_pic, ProfilePicUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:omniauthable, :omniauth_providers => [:facebook]

  def full_name
    try(:fname).to_s + " " + try(:lname).to_s  
  end

end


