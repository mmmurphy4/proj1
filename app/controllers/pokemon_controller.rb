class PokemonController < ApplicationController

  before_action :set_pokemon, only: [:capture, :damage]

  def new
    @pokemon = Pokemon.new
  end

  def capture
    # @pokemon = Pokemon.find(params[:id])
	  # @pokemon.trainer_id = current_trainer.id
	  # if @pokemon.update(pokemon_params)
    if @pokemon.update_attribute(:trainer_id, current_trainer.id)
	    redirect_to root_path
	  end
  end

  def damage
    # @pokemon = Pokemon.find(params[:id])
    if @pokemon.health <= 10
      @pokemon.destroy
    else
      @pokemon.update_attribute(:health, @pokemon.health - 10)
    end
    redirect_to current_trainer
  end

  def create
    @pokemon = Pokemon.create(params[:id])
    @pokemon.trainer_id = current_trainer.id
    @pokemon.level = 1
    @pokemon.health = 100
    if @pokemon.save
      redirect_to current_trainer
    else
      flash[:error] = @pokemon.errors.full_messages.to_sentence
    end 
  end

  private
    def pokemon_params
      params.require(:pokemon).permit(:name, :level, :trainer_id)
    end

    def set_pokemon
      @pokemon = Pokemon.find(params[:id])
    end
end
