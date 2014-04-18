require 'spec_helper'

describe UsersAppliance do

  describe "associations" do
    it { should belong_to(:user) }
    it { should belong_to(:appliance) }
  end

  describe "validations" do
    it { should validate_presence_of :user_id }
    it { should validate_presence_of :appliance_id }
    # it { should validate_uniqueness_of(:appliance_id).scoped_to(:user_id) }
  end
end
