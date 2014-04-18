class User::AppliancesController < ApplicationController

  def index
    @user_appliance_ids = current_user.appliances.map(&:id)
    @appliances = Appliance.all
    render json: @appliances, status: :ok, user_appliance_ids: @user_appliance_ids
  end

  def create
    @appliance = Appliance.find(appliance_params[:id])
    current_user.users_appliances.new(appliance_id: @appliance.id)

    if current_user.save
      render json: { appliances: @appliance }, status: :created
    else
      render json: { errors: @appliance.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @appliance = Appliance.find(params[:id])
    current_user.appliances.delete(@appliance)
    render json: {}, status: :no_content
  end

  private

  def appliance_params
    params.require(:appliances).permit(:id)
  end
end
