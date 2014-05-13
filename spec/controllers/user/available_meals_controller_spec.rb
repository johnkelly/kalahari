require 'spec_helper'

describe User::AvailableMealsController do
  let(:user) { FactoryGirl.build_stubbed_uuid(:user) }
  let(:meals) { [FactoryGirl.build_stubbed_uuid(:meal)] }
  let(:result) { Interactor::Context.build }

  before do
    allow(controller).to receive(:authenticate)
    allow(controller).to receive(:current_user).and_return(user)
  end

  describe "GET 'index'" do
    before do
      allow(GetAvailableMeals).to receive(:perform).and_return(result)
      allow(result).to receive(:available_meals).and_return(meals)
      get :index
    end
    it { should respond_with(:ok) }
    it { expect(GetAvailableMeals).to have_received(:perform) }
    it { expect(result).to have_received(:available_meals) }
    it { assigns(:result).should == result }
  end
end
