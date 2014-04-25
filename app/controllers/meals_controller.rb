class MealsController < ApplicationController

  def index
    @meals = Meal.all.includes(:directions, ingredients: [:food, :measurement])
    render json: @meals, status: :ok
  end
end
