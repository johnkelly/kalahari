require 'spec_helper'

describe GetAvailableMeals do
  let(:user) { FactoryGirl.build_stubbed_uuid(:user) }
  let(:meal) { FactoryGirl.build_stubbed_uuid(:meal) }
  let(:meals) { [meal] }
  let(:ingredients) { [FactoryGirl.build_stubbed_uuid(:ingredient)] }
  let(:interactor) { GetAvailableMeals.new(user: user) }

  describe "#perform" do
    before do
      allow(Meal).to receive(:all).and_return(meals)
      allow(meals).to receive(:includes).and_return(meals)
      allow(meal).to receive(:ingredients).and_return(ingredients)
      allow(interactor).to receive(:has_correct_ingredients_and_quantities?).and_return(true)
      interactor.perform
    end
    it { expect(Meal).to have_received(:all) }
    it { expect(meal).to have_received(:ingredients) }
    it { expect(interactor).to have_received(:has_correct_ingredients_and_quantities?) }
    it { expect(interactor.context[:available_meals]).to eq(meals) }
  end
end
