require 'spec_helper'

describe Ingredient do
  let(:ingredient) { FactoryGirl.build_stubbed_uuid(:ingredient) }
  let(:measurement) { FactoryGirl.build_stubbed_uuid(:measurement) }

  describe "associations" do
    it { should belong_to(:food) }
    it { should belong_to(:measurement) }
    it { should belong_to(:user) }
    it { should belong_to(:meal) }
  end

  describe "validations" do
    it { should validate_presence_of :quantity }
    it { should validate_presence_of :food_id }
    it { should validate_presence_of :measurement_id }
    # it { should validate_uniqueness_of(:food_id).scoped_to(:user_id) }
    # it { should validate_uniqueness_of(:food_id).scoped_to(:meal_id) }
    it { should validate_numericality_of(:quantity).is_greater_than_or_equal_to(0) }
  end

  describe "mL" do
    before do
      allow(ingredient).to receive(:measurement).and_return(measurement)
      allow(measurement).to receive(:mL).and_return(300)
      allow(ingredient).to receive(:quantity).and_return(3)
    end
    it "multiplies the measurement's mL with the quantity" do
      expect(ingredient.mL).to eq(900)
      expect(ingredient).to have_received(:measurement)
      expect(measurement).to have_received(:mL)
      expect(ingredient).to have_received(:quantity)
    end
  end
end
