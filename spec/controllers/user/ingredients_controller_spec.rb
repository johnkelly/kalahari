require 'spec_helper'

describe User::IngredientsController do
  let(:user) { FactoryGirl.build_stubbed_uuid(:user) }
  let(:ingredient) { FactoryGirl.build_stubbed_uuid(:ingredient) }
  let(:food) { FactoryGirl.build_stubbed_uuid(:food) }

  before do
    allow(controller).to receive(:authenticate)
    allow(controller).to receive(:current_user).and_return(user)
  end

  describe "GET 'index'" do
    before do
      allow(user).to receive(:ingredients).and_return(ingredient)
      allow(ingredient).to receive(:includes).and_return(ingredient)
      get :index
    end
    it { should respond_with(:ok) }
    it { expect(user).to have_received(:ingredients) }
    it { expect(ingredient).to have_received(:includes) }
    it { assigns(:ingredients).should == ingredient }
  end

  describe "POST 'create'" do
    context "success" do
      before do
        allow(Food).to receive(:where).and_return(food)
        allow(food).to receive(:first_or_create).and_return(food)
        allow(user).to receive(:ingredients).and_return(ingredient)
        allow(ingredient).to receive(:new).and_return(ingredient)
        allow(ingredient).to receive(:save).and_return(true)
        post :create, ingredients: { food_name: "Pumpkin", measurement_id: "FAKEID", quantity: "4" }
      end
      it { should respond_with(:created) }
      it { expect(Food).to have_received(:where) }
      it { expect(food).to have_received(:first_or_create) }
      it { expect(user).to have_received(:ingredients) }
      it { expect(ingredient).to have_received(:new) }
      it { expect(ingredient).to have_received(:save) }
      it { assigns(:ingredient).should == ingredient }
    end
    context "error" do
      before do
        allow(Food).to receive(:where).and_return(food)
        allow(food).to receive(:first_or_create).and_return(food)
        allow(user).to receive(:ingredients).and_return(ingredient)
        allow(ingredient).to receive(:new).and_return(ingredient)
        allow(ingredient).to receive(:save).and_return(false)
        post :create, ingredients: { food_name: "Pumpkin", measurement_id: "FAKEID", quantity: "4" }
      end
      it { should respond_with(:unprocessable_entity) }
      it { expect(Food).to have_received(:where) }
      it { expect(food).to have_received(:first_or_create) }
      it { expect(user).to have_received(:ingredients) }
      it { expect(ingredient).to have_received(:new) }
      it { expect(ingredient).to have_received(:save) }
      it { assigns(:ingredient).should == ingredient }
    end
  end

  describe "PATCH 'update'" do
    context "success" do
      before do
        allow(user).to receive(:ingredients).and_return(ingredient)
        allow(ingredient).to receive(:find).and_return(ingredient)
        allow(ingredient).to receive(:update).and_return(true)
        patch :update, id: "FAKEID", ingredients: { food_name: "Pumpkin", measurement_id: "FAKEID", quantity: "4" }
      end
      it { should respond_with(:no_content) }
      it { expect(user).to have_received(:ingredients) }
      it { expect(ingredient).to have_received(:find) }
      it { expect(ingredient).to have_received(:update) }
      it { assigns(:ingredient).should == ingredient }
    end
    context "error" do
      before do
        allow(user).to receive(:ingredients).and_return(ingredient)
        allow(ingredient).to receive(:find).and_return(ingredient)
        allow(ingredient).to receive(:update).and_return(false)
        patch :update, id: "FAKEID", ingredients: { food_name: "Pumpkin", measurement_id: "FAKEID", quantity: "4" }
      end
      it { should respond_with(:unprocessable_entity) }
      it { expect(user).to have_received(:ingredients) }
      it { expect(ingredient).to have_received(:find) }
      it { expect(ingredient).to have_received(:update) }
      it { assigns(:ingredient).should == ingredient }
    end
  end

  describe "DELETE 'destroy'" do
    before do
      allow(user).to receive(:ingredients).and_return(ingredient)
      allow(ingredient).to receive(:find).and_return(ingredient)
      allow(ingredient).to receive(:destroy)
      delete :destroy, id: ingredient.to_param
    end
    it { should respond_with(:no_content) }
    it { expect(user).to have_received(:ingredients) }
    it { expect(ingredient).to have_received(:find) }
    it { expect(ingredient).to have_received(:destroy) }
    it { assigns(:ingredient).should == ingredient }
  end
end
