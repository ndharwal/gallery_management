class Album < ActiveRecord::Base

  belongs_to :user
  has_many :images
  scope :sort, -> { order(:updated_at => :DESC ) }
  
  def self.search(search)
    if search
      where('title LIKE ?', "%#{search}%")
    else
    end
  end
end
