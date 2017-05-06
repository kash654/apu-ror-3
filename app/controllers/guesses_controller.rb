class GuessesController < ApplicationController
  before_action :set_game

  def create
    guess = @game.guesses.create!(guess_params)
    
    if guess.number == @game.number
      @game.update(completed: true)
      redirect_to game_path(@game), flash: { notice: 'Good guess!' }
    else
      redirect_to game_path(@game), flash: { notice: 'Sorry, try again!' }
    end
  end

  private
  
  def set_game
    @game = Game.find(params[:game_id])
  end
  
  def guess_params
    params.require(:guess).permit(:number) #security feature
  end

end

