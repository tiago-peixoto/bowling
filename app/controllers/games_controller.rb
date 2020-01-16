class GamesController < ApplicationController

  def create
    game = Game.create!()
    render json: game, status: :ok
  end

  def show
    game = Game.find(params[:id])
    render json: game.to_json(methods: [:score, :frames]), status: :ok
  end
end
