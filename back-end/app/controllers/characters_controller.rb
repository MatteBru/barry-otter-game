class CharactersController < ApplicationController
  before_action :set_character, only: [:show, :update, :destroy]

  # GET /characters
  # GET /characters.json
  def index
    @characters = Character.all

    render json: @characters
  end

  # GET /characters/1
  # GET /characters/1.json
  def show
  end

  # POST /characters
  # POST /characters.json
  def create
    @character = Character.new(character_params)

    if @character.save
      render :show, status: :created, location: @character
    else
      render json: @character.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /characters/1
  # PATCH/PUT /characters/1.json
  def update
    if @character.update(character_params)
      render :show, status: :ok, location: @character
    else
      render json: @character.errors, status: :unprocessable_entity
    end
  end

  # DELETE /characters/1
  # DELETE /characters/1.json
  def destroy
    @character.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_character
      @character = Character.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def character_params
      params.fetch(:character, {})
    end
end
