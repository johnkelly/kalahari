require 'spec_helper'

describe CheckIngredients do
  let(:user) { FactoryGirl.build_stubbed_uuid(:user) }
  let(:meal) { FactoryGirl.build_stubbed_uuid(:meal) }
  let(:food) { FactoryGirl.build_stubbed_uuid(:food) }
  let(:ingredients) { [FactoryGirl.build_stubbed_uuid(:ingredient)] }
  let(:interactor) { CheckIngredients.new(user: user) }

  describe "#perform" do
    context "user has ingredients" do
      before do
        allow(Meal).to receive(:find).and_return(meal)
        allow(interactor).to receive(:user_has_neccessary_ingredients?).and_return(true)
        interactor.perform
      end
      it { expect(Meal).to have_received(:find) }
      it { expect(interactor).to have_received(:user_has_neccessary_ingredients?) }
    end

    context "user does NOT have ingredients" do
      before do
        allow(Meal).to receive(:find).and_return(meal)
        allow(interactor).to receive(:user_has_neccessary_ingredients?).and_return(false)
        allow(interactor).to receive(:fail!)
        interactor.perform
      end
      it { expect(Meal).to have_received(:find) }
      it { expect(interactor).to have_received(:user_has_neccessary_ingredients?) }
      it { expect(interactor).to have_received(:fail!) }
    end
  end
end
