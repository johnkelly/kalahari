require 'spec_helper'

describe FoodsController do
  let(:user) { FactoryGirl.build_stubbed_uuid(:user) }
  let(:food) { FactoryGirl.build_stubbed_uuid(:food) }
  let(:foods) { [food] }

  before do
    allow(controller).to receive(:authenticate)
    allow(controller).to receive(:current_user).and_return(user)
  end

  describe "GET 'index'" do
    before do
      allow(Food).to receive(:where).and_return(foods)
      get :index, name: "Salt"
    end
    it { should respond_with(:ok) }
    it { expect(Food).to have_received(:where) }
    it { assigns(:food).should == foods }
  end
end
