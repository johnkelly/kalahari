class User::IngredientsController < ApplicationController

  def index
    @ingredients = current_user.ingredients.includes(:food, :measurement)
    render json: @ingredients, status: :ok
  end

  def create
    @ingredient = current_user.ingredients.new(ingredient_params)

    if @ingredient.save
      render json: @ingredient, status: :created
    else
      render json: { errors: @ingredient.errors.full_messages }, status: :unprocessable_entity
    end
  end


  def update
    @ingredient = current_user.ingredients.find(params[:id])

    if @ingredient.update(measurement_id: ingredient_params[:measurement_id],
                          quantity: ingredient_params[:quantity])
      render json: {}, status: :no_content
    else
      render json: { errors: @ingredient.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @ingredient = current_user.ingredients.find(params[:id])
    @ingredient.destroy
    render json: {}, status: :no_content
  end

  private

  def ingredient_params
    params.require(:ingredients).permit(:food_id, :measurement_id, :quantity)
  end
end
