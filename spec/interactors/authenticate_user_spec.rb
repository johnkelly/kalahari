require 'spec_helper'

describe AuthenticateUser do
  let(:user) { FactoryGirl.build_stubbed_uuid(:user) }
  let(:interactor) { AuthenticateUser.new(email: "lawrence@arabia.com", password: "password") }

  describe "#perform" do
    context "user found" do
      before do
        allow(User).to receive(:where).and_return([user])
        allow(user).to receive(:authenticate).and_return(true)
        interactor.perform
      end
      it { expect(User).to have_received(:where) }
      it { expect(user).to have_received(:authenticate) }
      it { expect(interactor.context[:user]).to eq(user) }
    end

    context "no user found" do
      before do
        allow(User).to receive(:where).and_return([])
        interactor.perform
      end
      it { expect(User).to have_received(:where) }
      it { expect(interactor.context[:errors]).to eq(["Your email or password is incorrect."]) }
    end
  end
end
