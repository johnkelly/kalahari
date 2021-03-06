require 'spec_helper'

describe UseIngredients do
  let(:user) { FactoryGirl.build_stubbed_uuid(:user) }
  let(:users_meal) { FactoryGirl.build_stubbed_uuid(:users_meal) }
  let(:interactor) { UseIngredients.new(user: user, users_meal: users_meal) }
  let(:ingredients) { [FactoryGirl.build_stubbed_uuid(:ingredient)] }

  describe "#perform" do
    before do
      allow(users_meal).to receive(:meal).and_return(users_meal)
      allow(users_meal).to receive(:ingredients).and_return(ingredients)
      allow(ingredients).to receive(:includes).and_return(ingredients)
      allow(user).to receive(:ingredients).and_return(ingredients)
      allow(ingredients).to receive(:includes).and_return(ingredients)
      allow(interactor).to receive(:reduce_quantity_or_remove_ingredient)
      interactor.perform
    end
    it { expect(users_meal).to have_received(:meal) }
    it { expect(users_meal).to have_received(:ingredients) }
    it { expect(user).to have_received(:ingredients) }
    it { expect(ingredients).to have_received(:includes).twice }
    it { expect(interactor).to have_received(:reduce_quantity_or_remove_ingredient) }
  end
end
