class Article < ActiveRecord::Base
  belongs_to :user
  
  # Validate the name field and enforce that the presence is true (i.e. you have to enter something)
  validates :user_id, presence: true
  validates :title, presence: true, length: { minimum: 5, maximum: 100 }
  validates :body, presence: true
  mount_uploader :picture, PictureUploader
  validate :picture_size
  default_scope -> { order(updated_at: :desc) }
  
  private
    def picture_size
       if picture.size > 5.megabytes
           errors.add(:picture, "should be less than 5MB")
       end
    end
    
end