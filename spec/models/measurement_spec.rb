require 'spec_helper'

describe Measurement do

  describe "associations" do
    it { should have_many(:ingredients).dependent(:destroy) }
  end

  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_uniqueness_of :name }
  end
end
