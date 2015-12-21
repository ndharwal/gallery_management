class User < ActiveRecord::Base
  has_many :albums
  belongs_to :comment
  has_many :images, through: :albums
  has_many :comments, through: :albums 
  acts_as_voter
  validates :fname, :lname, :contact, presence: true
  validates :contact, length: { minimum: 10, maximum: 10 }, numericality: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  mount_uploader :profile_pic, ProfilePicUploader
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable,:omniauthable, :omniauth_providers => [:facebook]
  scope :current_user_skip, -> (user) { where.not(:id => user.id)}  
end


