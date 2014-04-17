require 'spec_helper'

describe AddUser do
  let(:user) { FactoryGirl.build_stubbed_uuid(:user) }
  let(:interactor) { AddUser.new(email: "test@example.com", password: "password", password_confirmation: "password", first_name: "John") }

  describe "#perform" do
    context "success" do
      before do
        allow(User).to receive(:new).and_return(user)
        allow(user).to receive(:save).and_return(true)
        interactor.perform
      end
      it { expect(User).to have_received(:new) }
      it { expect(user).to have_received(:save) }
      it { expect(interactor.context[:user]).to eq(user) }
    end

    context "failure" do
      before do
        allow(User).to receive(:new).and_return(user)
        allow(user).to receive(:save).and_return(false)
        user.stub_chain(:errors, :full_messages).and_return(["Email can't be blank"])
        interactor.perform
      end
      it { expect(User).to have_received(:new) }
      it { expect(user).to have_received(:save) }
      it { expect(interactor.context[:errors]).to eq(["Email can't be blank"]) }
    end
  end
end
