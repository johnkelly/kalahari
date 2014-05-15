require 'spec_helper'

describe Meal do
  describe "associations" do
    it { should have_many(:ingredients).dependent(:destroy) }
    it { should have_many(:directions).dependent(:destroy) }
    it { should have_many(:users_meals).dependent(:destroy) }
    it { should have_many(:users).through(:users_meals) }
    it { should have_many(:meals_appliances).dependent(:destroy) }
    it { should have_many(:appliances).through(:meals_appliances) }
  end

  describe "validations" do
    it { should validate_presence_of :name }
  end
end
