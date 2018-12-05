class PassportsController < ApplicationController
  before_action :set_passport, only: [:show, :update, :destroy]

  # GET /passports
  def index
    @passports = Passport.all

    render json: @passports
  end

  # GET /passports/1
  def show
    render json: @passport
  end

  # POST /passports
  def create
    @passport = Passport.new(passport_params)

    if @passport.save
      render json: @passport, status: :created, location: @passport
    else
      render json: @passport.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /passports/1
  def update
    if @passport.update(passport_params)
      render json: @passport
    else
      render json: @passport.errors, status: :unprocessable_entity
    end
  end

  # DELETE /passports/1
  def destroy
    @passport.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_passport
      @passport = Passport.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def passport_params
      params.require(:passport).permit(:title, :email, :cred, :url, :contact, :note)
    end
end
