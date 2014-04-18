require 'spec_helper'

describe ApplianceSerializer do
  let(:appliance) { FactoryGirl.build_stubbed_uuid(:appliance) }
  let(:serializer_with_option_and_id) { ApplianceSerializer.new(appliance, user_appliance_ids: [appliance.id]) }
  let(:serializer_with_option) { ApplianceSerializer.new(appliance, user_appliance_ids: ["FAKEID"]) }
  let(:serializer) { ApplianceSerializer.new(appliance) }

  describe "owned?" do
    context "has option and id" do
      it { expect(serializer_with_option_and_id.owned?).to eq(true) }
    end

    context "has option with different id" do
      it { expect(serializer_with_option.owned?).to eq(false) }
    end

    context "does NOT have option" do
      it { expect(serializer.owned?).to eq(false) }
    end
  end
end
