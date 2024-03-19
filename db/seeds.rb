require 'json'
require 'open-uri'
require 'faker'

# Fetch data from Disney API
def fetch_character_data(api_url)
    response = URI.open(api_url)
    json_data = JSON.parse(response.read, symbolize_names: true)
    json_data[:data]
end
  


# Insert character data into characters table
def insert_character_data(character_data)
    character_data.each do |data|
      character = Character.create(
        name: data[:name],
        imageURL: data[:imageUrl]
      )
      data[:films].each do |film_name|
        character.films.create(name: film_name)
      end
      data[:tvShows].each do |tv_show_name|
        character.tv_shows.create(name: tv_show_name)
      end
      data[:videoGames].each do |video_game_name|
        character.video_games.create(name: video_game_name)
      end
    end
  end
  

# Generate random user data and insert into users table
def insert_random_user_data(num_users)
  num_users.times do
    User.create(
      email: Faker::Internet.email,
      name: Faker::Name.name
    )
  end
end

# Insert random liked character data into likeds table
def insert_random_liked_data(num_likeds, num_characters, num_users)
  num_likeds.times do
    Liked.create(
      character_id: rand(1..num_characters),
      user_id: rand(1..num_users)
    )
  end
end

# Main method
def main
  api_url = 'https://api.disneyapi.dev/character'
  character_data = fetch_character_data(api_url)
 
  insert_character_data(character_data)

  num_users = 10 
  insert_random_user_data(num_users)

  num_likeds = 20 
  num_characters = Character.count
  insert_random_liked_data(num_likeds, num_characters, num_users)
end

main
