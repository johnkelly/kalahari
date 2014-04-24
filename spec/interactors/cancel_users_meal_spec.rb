require 'spec_helper'

describe CancelUsersMeal do
  let(:interactor) { CancelUsersMeal.new }

  describe "Organizer" do
    before do
      allow(ReturnIngredients).to receive(:perform)
      allow(DeleteUsersMeal).to receive(:perform)
      interactor.perform
    end
    it { expect(ReturnIngredients).to have_received(:perform) }
    it { expect(DeleteUsersMeal).to have_received(:perform) }
  end
end
