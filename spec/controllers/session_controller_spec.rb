require 'spec_helper'

describe SessionController do
  let(:user) { FactoryGirl.build_stubbed_uuid(:user) }
  let(:result) { Interactor::Context.build }

  describe "POST 'create'" do
    context "sign in success" do
      before do
        allow(SignIn).to receive(:perform).and_return(result)
        allow(result).to receive(:success?).and_return(true)
        allow(result).to receive(:user)
        post :create, session: { email: "test@example.com", password: "password" }
      end
      it { should respond_with(:success) }
      it { expect(SignIn).to have_received(:perform) }
      it { expect(result).to have_received(:success?) }
      it { expect(result).to have_received(:user) }
      it { assigns(:result).should == result }
    end

    context "sign in failure" do
      before do
        allow(SignIn).to receive(:perform).and_return(result)
        allow(result).to receive(:success?).and_return(false)
        allow(result).to receive(:errors)
        post :create, session: { email: "wrongexample.com", password: "password" }
      end
      it { should respond_with(:unprocessable_entity) }
      it { expect(SignIn).to have_received(:perform) }
      it { expect(result).to have_received(:success?) }
      it { expect(result).to have_received(:errors) }
      it { assigns(:result).should == result }
    end
  end
end
