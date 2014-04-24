require 'spec_helper'

describe AddUsersMeal do
  let(:user) { FactoryGirl.build_stubbed_uuid(:user) }
  let(:users_meal) { FactoryGirl.build_stubbed_uuid(:users_meal) }
  let(:interactor) { AddUsersMeal.new(user: user) }

  describe "#perform" do
    context "user meal is saved" do
      before do
        allow(user).to receive(:users_meals).and_return(users_meal)
        allow(users_meal).to receive(:new).and_return(users_meal)
        allow(users_meal).to receive(:save).and_return(true)
        interactor.perform
      end
      it { expect(user).to have_received(:users_meals) }
      it { expect(users_meal).to have_received(:new) }
      it { expect(users_meal).to have_received(:save) }
    end

    context "user meal is NOT saved" do
      before do
        allow(user).to receive(:users_meals).and_return(users_meal)
        allow(users_meal).to receive(:new).and_return(users_meal)
        allow(users_meal).to receive(:save).and_return(false)
        interactor.perform
      end
      it { expect(user).to have_received(:users_meals) }
      it { expect(users_meal).to have_received(:new) }
      it { expect(users_meal).to have_received(:save) }
    end
  end
end
