require 'spec_helper'

describe CreateUsersMeal do
  let(:interactor) { CreateUsersMeal.new }

  describe "Organizer" do
    before do
      allow(CheckIngredients).to receive(:perform)
      allow(AddUsersMeal).to receive(:perform)
      allow(UseIngredients).to receive(:perform)
      interactor.perform
    end
    it { expect(CheckIngredients).to have_received(:perform) }
    it { expect(AddUsersMeal).to have_received(:perform) }
    it { expect(UseIngredients).to have_received(:perform) }
  end
end
