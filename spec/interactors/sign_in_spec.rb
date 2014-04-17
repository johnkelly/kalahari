require 'spec_helper'

describe SignIn do
  let(:interactor) { SignIn.new }

  describe "Organizer" do
    before do
      allow(AuthenticateUser).to receive(:perform)
      allow(IncrementSignInCount).to receive(:perform)
      interactor.perform
    end
    it { expect(AuthenticateUser).to have_received(:perform) }
    it { expect(IncrementSignInCount).to have_received(:perform) }
  end
end
