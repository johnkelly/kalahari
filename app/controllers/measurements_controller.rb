class MeasurementsController < ApplicationController

  def index
    @measurements = Measurement.all
    render json: @measurements, status: :ok
  end
end
