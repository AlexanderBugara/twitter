class User < ApplicationRecord
  has_many :microposts, dependent: :destroy
  has_many :likes, class_name: "Like", foreign_key: "user_id", dependent: :destroy
  has_many :liked_posts, through: :likes, source: :micropost

  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, length: { minimum: 6 }
  
  def feed    
    Micropost.where("user_id = ?", id)  
  end
  
  def liked?(micropost)
    return liked_posts.include?(micropost)
  end
  
  def like(micropost)
    liked_posts << micropost
  end
  
  def unlike(micropost)
    liked_posts.delete(micropost)
  end

end
