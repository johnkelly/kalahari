require 'spec_helper'

describe IncrementSignInCount do
  let(:user) { FactoryGirl.build_stubbed_uuid(:user) }
  let(:interactor) { IncrementSignInCount.new(user: user) }

  describe "#perform" do
    before do
      allow(user).to receive(:increment!)
      interactor.perform
    end
    it { expect(user).to have_received(:increment!) }
    it { expect(interactor.context[:user]).to eq(user) }
  end
end
