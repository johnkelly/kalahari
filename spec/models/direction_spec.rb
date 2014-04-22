require 'spec_helper'

describe Direction do
  describe "associations" do
    it { should belong_to(:meal) }
  end

  describe "validations" do
    it { should validate_presence_of :meal_id }
    it { should validate_presence_of :position }
    it { should validate_presence_of :name }
    it { should validate_numericality_of(:position).only_integer.is_greater_than_or_equal_to(0) }
  end
end
