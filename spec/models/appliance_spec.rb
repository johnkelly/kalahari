require 'spec_helper'

describe Appliance do

  describe "associations" do
    it { should have_many(:users_appliances).dependent(:destroy) }
    it { should have_many(:users).through(:users_appliances) }
  end

  describe "validations" do
    it { should validate_presence_of :kind }
    it { should validate_uniqueness_of :kind }
  end
end
