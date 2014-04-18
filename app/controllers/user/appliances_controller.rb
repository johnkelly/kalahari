class User::AppliancesController < ApplicationController

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
