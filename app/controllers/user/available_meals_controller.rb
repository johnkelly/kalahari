class User::AvailableMealsController < ApplicationController

  def index
    @result = GetAvailableMeals.perform(user: current_user)
    render json: @result.available_meals, status: :ok
  end
end
