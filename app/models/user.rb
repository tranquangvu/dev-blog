class User < ActiveRecord::Base
  has_many :articles, dependent: :destroy
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :user_name, presence: true, length: { minimum: 3, maximum: 16 }
end