require 'spec_helper'

describe MeasurementsController do
  let(:user) { FactoryGirl.build_stubbed_uuid(:user) }
  let(:measurements) { [FactoryGirl.build_stubbed_uuid(:measurement)] }

  before do
    allow(controller).to receive(:authenticate)
    allow(controller).to receive(:current_user).and_return(user)
  end

  describe "GET 'index'" do
    before do
      allow(Measurement).to receive(:all).and_return(measurements)
      get :index
    end
    it { should respond_with(:ok) }
    it { expect(Measurement).to have_received(:all) }
    it { assigns(:measurements).should == measurements }
  end
end
