require 'spec_helper'

describe User::IngredientsController do
  let(:user) { FactoryGirl.build_stubbed_uuid(:user) }
  let(:ingredient) { FactoryGirl.build_stubbed_uuid(:ingredient) }

  before do
    allow(controller).to receive(:authenticate)
    allow(controller).to receive(:current_user).and_return(user)
  end

  describe "GET 'index'" do
    before do
      allow(user).to receive(:ingredients).and_return([ingredient])
      get :index
    end
    it { should respond_with(:ok) }
    it { expect(user).to have_received(:ingredients) }
    it { assigns(:ingredients).should == [ingredient] }
  end
end
