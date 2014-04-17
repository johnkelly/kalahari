require 'spec_helper'

describe RegistrationController do
  let(:result) { Interactor::Context.build }

  describe "POST 'create'" do
    context "Sign Up success" do
      before do
        allow(SignUp).to receive(:perform).and_return(result)
        allow(result).to receive(:success?).and_return(true)
        allow(result).to receive(:user)
        post :create, register: { email: "test@example.com", password: "password", password_confirmation: "password", first_name: "John" }
      end
      it { should respond_with(:created) }
      it { expect(SignUp).to have_received(:perform) }
      it { expect(result).to have_received(:success?) }
      it { expect(result).to have_received(:user) }
      it { assigns(:result).should == result }
    end

    context "Sign Up failure" do
      before do
        allow(SignUp).to receive(:perform).and_return(result)
        allow(result).to receive(:success?).and_return(false)
        allow(result).to receive(:errors)
        post :create, register: { email: "test@example.com", password: "password", password_confirmation: "password", first_name: "John" }
      end
      it { should respond_with(:unprocessable_entity) }
      it { expect(SignUp).to have_received(:perform) }
      it { expect(result).to have_received(:success?) }
      it { expect(result).to have_received(:errors) }
      it { assigns(:result).should == result }
    end
  end
end
