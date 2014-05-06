require 'spec_helper'

describe Measurement do

  describe "associations" do
    it { should have_many(:ingredients).dependent(:destroy) }
  end

  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_uniqueness_of :name }
    it { should validate_presence_of :mL }
  end

  describe "self.convert_mL_to_measurement" do
    it "returns a decimal amount rounded to 5 places" do
      expect(Measurement.convert_mL_to_measurement(100,17)).to eq(5.88235)
    end
  end
end
