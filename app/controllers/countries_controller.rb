class CountriesController < ApplicationController
  before_action :set_country, only: [:show, :edit, :update, :destroy]

  def index
    @countrys = Country.all
  end

  def new
    @country = Country.new
  end

  def create
    @country = Country.new(country_params)
    if @country.valid?
      @country.save
      redirect_to country_path(@country)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @country.update(country_params)
      redirect_to country_path(@country)
    else
      render :edit
    end
  end

  def destroy
    @country.destroy
    redirect_to countrys_path
  end

  private

  def country_params
    params.require(:country).permit(:name, :informaiton, :language, :flag, :photo, :alpha2)
  end

  def set_country
    @country = Country.find(params[:id])
  end
end
