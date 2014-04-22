require 'spec_helper'

describe Ingredient do

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
  end
end
