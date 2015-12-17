class Album < ActiveRecord::Base
  has_many :comments, as: :commentable, :dependent => :destroy
  acts_as_votable
  has_many :images, :dependent => :destroy 
  belongs_to :user 
  scope :sort, -> { order(:updated_at => :DESC ) }
  
  def self.search(search)
    if search
      where('title LIKE ?', "%#{search}%")
    end
  end
end
