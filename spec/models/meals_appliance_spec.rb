require 'spec_helper'

describe MealsAppliance do

  describe "associations" do
    it { should belong_to(:meal) }
    it { should belong_to(:appliance) }
  end

  describe "validations" do
    it { should validate_presence_of :meal_id }
    it { should validate_presence_of :appliance_id }
    # it { should validate_uniqueness_of(:appliance_id).scoped_to(:meal_id) }
  end
end

