class User::MealsController < ApplicationController

  def index
    @users_meals = current_user.users_meals.includes(meal: [:directions, ingredients: [:food, :measurement]])
    render json: @users_meals, status: :ok
  end

  def create
    @result = CreateUsersMeal.perform(meal_params.merge({ user: current_user }))

    if @result.success?
      render json: @result.users_meal, status: :created
    else
      render json: { errors: @result.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @users_meal = current_user.users_meals.find(params[:id])
    CancelUsersMeal.perform({ users_meal: @users_meal, user: current_user })
    render json: {}, status: :no_content
  end

  private

  def meal_params
    params.require(:meal).permit(:meal_id)
  end
end
