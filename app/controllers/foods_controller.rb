class FoodsController < ApplicationController

  def index
    @food = Food.where("name iLike ?", "%#{params.try(:[], :name)}%")
    render json: @food, status: :ok
  end
end
