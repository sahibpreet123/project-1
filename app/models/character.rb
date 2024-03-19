class Character < ApplicationRecord
  has_many :video_games
  has_many :tv_shows
  has_many :films
  has_many :likes, class_name: 'Liked' 
  has_many :users, through: :likes


  
  validates :name, presence: true, uniqueness: true
  validates :imageURL, presence: true
end
