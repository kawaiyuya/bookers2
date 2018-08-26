class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

         has_many :books

         attachment :profile_image

         validates :introduction_id, length: { maximum: 50 }

         validates :name, {presence: true}
         validates :email, {presence: true}
end
