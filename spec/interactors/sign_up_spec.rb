require 'spec_helper'

describe SignUp do
  let(:interactor) { SignUp.new }

  describe "Organizer" do
    before do
      allow(AddUser).to receive(:perform)
      allow(IncrementSignInCount).to receive(:perform)
      interactor.perform
    end
    it { expect(AddUser).to have_received(:perform) }
    it { expect(IncrementSignInCount).to have_received(:perform) }
  end
end
