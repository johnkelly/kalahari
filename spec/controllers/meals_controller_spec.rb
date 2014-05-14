require 'spec_helper'

describe MealsController do
  let(:user) { FactoryGirl.build_stubbed_uuid(:user) }
  let(:meal) { FactoryGirl.build_stubbed_uuid(:meal) }
  let(:meals) { [meal] }

  before do
    allow(controller).to receive(:authenticate)
    allow(controller).to receive(:current_user).and_return(user)
  end

  describe "GET 'index'" do
    before do
      allow(Meal).to receive(:all).and_return(meals)
      allow(meals).to receive(:includes).and_return(meals)
      get :index
    end
    it { should respond_with(:ok) }
    it { expect(Meal).to have_received(:all) }
    it { expect(meals).to have_received(:includes) }
    it { assigns(:meals).should == meals }
  end

  describe "GET 'show'" do
    before do
      allow(Meal).to receive(:find).and_return(meal)
      get :show, id: meal.to_param
    end
    it { expect(Meal).to have_received(:find) }
    it { assigns(:meal).should == meal }
  end
end
