class CharactersController < ApplicationController
  def index
    @characters = Character.page(params[:page]).per(20)
    if params[:search].present?
      @characters = @characters.where('name LIKE ?', "%#{params[:search]}%")
    end

    if params[:category].present? && params[:category] != 'all'
      # Ensure that the parameter matches the association name
      case params[:category]
      when 'films'
        @characters = @characters.joins(:films).distinct
      when 'tv_shows'
        @characters = @characters.joins(:tv_shows).distinct
      when 'video_games'
        @characters = @characters.joins(:video_games).distinct
      end
    end
  end
end
