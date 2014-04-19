class User::IngredientsController < ApplicationController

  def index
    @ingredients = current_user.ingredients.includes(:food, :measurement)
    render json: @ingredients, status: :ok
  end

  private

  def appliance_params
    params.require(:appliances).permit(:id)
  end
end

