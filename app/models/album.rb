class Album < ActiveRecord::Base
  belongs_to :user
  has_many :images
  def self.search(search)
    if search
      where('title LIKE ?', "%#{search}%")
    else
      scoped
    end
  end
end
