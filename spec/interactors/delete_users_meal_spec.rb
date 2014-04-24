require 'spec_helper'

describe DeleteUsersMeal do
  let(:users_meal) { FactoryGirl.build_stubbed_uuid(:users_meal) }
  let(:interactor) { DeleteUsersMeal.new(users_meal: users_meal) }

  describe "#perform" do
    before do
      allow(users_meal).to receive(:destroy!)
      interactor.perform
    end
    it { expect(users_meal).to have_received(:destroy!) }
  end
end
