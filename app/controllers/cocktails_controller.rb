class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show, :edit, :update, :destroy]

  def index
    @cocktails = Cocktail.all
  end

  def show
  end

  def new
    @cocktail = Cocktail.new
  end

  def edit
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktails_path
    else
      @cocktail.new
    end
  end
end


def update
  if @cocktail.update(cocktail_params)
    redirect_to cocktails_path
  else
    @cocktail.new
  end
end

def destroy
  @cocktail.destroy
end


private
def set_cocktail
  @cocktail = Cocktail.find(params[:id])
end

def cocktail_params
  params.require(:cocktail).permit(:name)
end
