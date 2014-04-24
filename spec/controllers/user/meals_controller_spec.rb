require 'spec_helper'

describe User::MealsController do
  let(:user) { FactoryGirl.build_stubbed_uuid(:user) }
  let(:users_meals) { [FactoryGirl.build_stubbed_uuid(:users_meal)] }
  let(:users_meal) { FactoryGirl.build_stubbed_uuid(:users_meal) }
  let(:meal) { FactoryGirl.build_stubbed_uuid(:meal) }
  let(:result) { Interactor::Context.build }

  before do
    allow(controller).to receive(:authenticate)
    allow(controller).to receive(:current_user).and_return(user)
  end

  describe "GET 'index'" do
    before do
      allow(user).to receive(:users_meals).and_return(users_meal)
      allow(users_meal).to receive(:includes).and_return(users_meals)
      get :index
    end
    it { should respond_with(:ok) }
    it { expect(user).to have_received(:users_meals) }
    it { expect(users_meal).to have_received(:includes) }
    it { assigns(:users_meals).should == users_meals }
  end

  describe "POST 'create'" do
    context "success" do
      before do
        allow(CreateUsersMeal).to receive(:perform).and_return(result)
        allow(result).to receive(:success?).and_return(true)
        allow(result).to receive(:users_meal).and_return(users_meal)
        post :create, meal: { meal_id: meal.to_param }, format: :json
      end
      it { should respond_with(:created) }
      it { expect(CreateUsersMeal).to have_received(:perform) }
      it { expect(result).to have_received(:success?) }
      it { expect(result).to have_received(:users_meal) }
      it { assigns(:result).should == result }
    end

    context "failure" do
      before do
        allow(CreateUsersMeal).to receive(:perform).and_return(result)
        allow(result).to receive(:success?).and_return(false)
        allow(result).to receive(:users_meal).and_return(users_meals)
        allow(result).to receive(:errors)
        post :create, meal: { meal_id: meal.to_param }, format: :json
      end
      it { should respond_with(:unprocessable_entity) }
      it { expect(CreateUsersMeal).to have_received(:perform) }
      it { expect(result).to have_received(:success?) }
      it { expect(result).to have_received(:errors) }
      it { assigns(:result).should == result }
    end
  end

  describe "DELETE 'destroy'" do
    before do
      allow(user).to receive(:users_meals).and_return(users_meal)
      allow(users_meal).to receive(:find).and_return(users_meal)
      allow(CancelUsersMeal).to receive(:perform).and_return(result)
      delete :destroy, id: users_meal.to_param
    end
    it { should respond_with(:no_content) }
    it { expect(user).to have_received(:users_meals) }
    it { expect(users_meal).to have_received(:find) }
    it { expect(CancelUsersMeal).to have_received(:perform) }
    it { assigns(:users_meal).should == users_meal }
  end
end
