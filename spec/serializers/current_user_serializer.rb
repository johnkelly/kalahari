require 'spec_helper'

describe CurrentUserSerializer do
  let(:user) { FactoryGirl.build_stubbed_uuid(:user) }
  let(:serializer) { CurrentUserSerializer.new(user) }

  describe "gravatar" do
    before do
      allow(Digest::MD5).to receive(:hexdigest).and_return("camel")
      expect(user_serializer.gravatar).to eq("https://secure.gravatar.com/avatar/camel?d=identicon")
    end
    it { expect(Digest::MD5).to have_received(:hexdigest) }
  end
end
