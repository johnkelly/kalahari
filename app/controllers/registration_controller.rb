class RegistrationController < ApplicationController
  skip_before_action :authenticate

  def create
    @result = SignUp.perform(user_params)

    if @result.success?
      render json: @result.user, serializer: CurrentUserSerializer, status: :created
    else
      render json: { errors: @result.errors }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:register).permit(:email, :password, :password_confirmation, :first_name)
  end
end
