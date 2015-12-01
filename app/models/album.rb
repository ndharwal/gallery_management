class Album < ActiveRecord::Base
  has_many :comments, as: :commentable, :dependent => :destroy
  has_many :images
  belongs_to :user 
  scope :sort, -> { order(:updated_at => :DESC ) }
  
  def self.search(search)
    if search
      where('title LIKE ?', "%#{search}%")
    else
    end
  end
end
