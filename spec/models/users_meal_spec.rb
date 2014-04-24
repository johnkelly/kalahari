require 'spec_helper'

describe UsersMeal do

  describe "associations" do
    it { should belong_to(:meal) }
    it { should belong_to(:user) }
  end

  describe "validations" do
    it { should validate_presence_of :meal_id }
    it { should validate_presence_of :user_id }
  end
end
