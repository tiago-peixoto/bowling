class ThrowsController < ApplicationController

  def create
    game = Game.find(params[:game_id])
    game.throws.create!(throw_params)
    render json: game, status: :ok
  end

  private

  def throw_params
    params.permit(:pins_down)
  end
end
