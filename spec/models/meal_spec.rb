require 'spec_helper'

describe Meal do
  describe "associations" do
    it { should have_many(:ingredients).dependent(:destroy) }
    it { should have_many(:directions).dependent(:destroy) }
  end

  describe "validations" do
    it { should validate_presence_of :name }
  end
end
