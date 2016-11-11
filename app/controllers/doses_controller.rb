class DosesController < ApplicationController
  before_action :find_doses, only: [:destroy]
  before_action :find_cocktail, only: [:new, :create, :destroy]


  def create
    @dose = @cocktail.doses.new(dose_params)
    if
      @dose.save
      redirect_to @cocktail
    else
      render 'cocktails/show'
    end
  end

  def destroy
    find_doses
    @dose.destroy
    redirect_to @dose.cocktail
  end

  private


  def find_doses
    @dose = Dose.find(params[:id])
  end

  def find_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end


  def cocktail_params
    params.require(:dose).permit(:description)
  end
end
