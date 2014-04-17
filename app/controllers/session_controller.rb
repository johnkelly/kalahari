class SessionController < ApplicationController
  skip_before_action :authenticate

  def create
    @result = SignIn.perform(session_params)

    if @result.success?
      render json: @result.user, serializer: CurrentUserSerializer, status: :ok
    else
      render json: { errors: @result.errors }, status: :unprocessable_entity
    end
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end

