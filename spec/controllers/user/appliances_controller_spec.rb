require 'spec_helper'

describe User::AppliancesController do
  let(:user) { FactoryGirl.build_stubbed_uuid(:user) }
  let(:appliance) { FactoryGirl.build_stubbed_uuid(:appliance) }

  before do
    allow(controller).to receive(:authenticate)
    allow(controller).to receive(:current_user).and_return(user)
  end

  describe "POST 'create'" do
    context "success" do
      before do
        allow(Appliance).to receive(:find).and_return(appliance)
        allow(user).to receive(:users_appliances).and_return(appliance)
        allow(appliance).to receive(:new).and_return(appliance)
        allow(user).to receive(:save).and_return(true)
        post :create, appliances: { id: "fakeid" }
      end
      it { should respond_with(:created) }
      it { expect(Appliance).to have_received(:find) }
      it { expect(user).to have_received(:users_appliances) }
      it { expect(appliance).to have_received(:new) }
      it { expect(user).to have_received(:save) }
      it { assigns(:appliance).should == appliance }
    end

    context "error" do
      before do
        allow(Appliance).to receive(:find).and_return(appliance)
        allow(user).to receive(:users_appliances).and_return(appliance)
        allow(appliance).to receive(:new).and_return(appliance)
        allow(user).to receive(:save).and_return(false)
        post :create, appliances: { id: "fakeid" }
      end
      it { should respond_with(:unprocessable_entity) }
      it { expect(Appliance).to have_received(:find) }
      it { expect(user).to have_received(:users_appliances) }
      it { expect(appliance).to have_received(:new) }
      it { expect(user).to have_received(:save) }
      it { assigns(:appliance).should == appliance }
    end
  end

  describe "DELETE 'destroy'" do
    before do
      allow(Appliance).to receive(:find).and_return(appliance)
      allow(user).to receive(:appliances).and_return(appliance)
      allow(appliance).to receive(:delete)
      delete :destroy, id: "fakeid"
    end
    it { should respond_with(:no_content) }
    it { expect(Appliance).to have_received(:find) }
    it { expect(user).to have_received(:appliances) }
    it { expect(appliance).to have_received(:delete) }
    it { assigns(:appliance).should == appliance }
  end
end
