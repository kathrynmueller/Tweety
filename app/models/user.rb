class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

# associations
  has_many :tweets

  mount_uploader :avatar, AvatarUploader

  # validations:
  validates :username, presence: true, uniqueness: true

  serialize :following, Array

end
