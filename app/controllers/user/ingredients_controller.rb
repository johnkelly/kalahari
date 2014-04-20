class User::IngredientsController < ApplicationController

  def index
    @ingredients = current_user.ingredients.includes(:food, :measurement)
    render json: @ingredients, status: :ok
  end

  def create
    @food = Food.where(name: ingredient_params[:food_name]).first_or_create
    @ingredient = current_user.ingredients.new(food_id: @food.id,
                                                measurement_id: ingredient_params[:measurement_id],
                                                quantity: ingredient_params[:quantity])
    if @ingredient.save
      render json: { ingredient: @ingredient }, status: :created
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
    params.require(:ingredients).permit(:food_name, :measurement_id, :quantity)
  end
end
