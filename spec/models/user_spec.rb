require 'spec_helper'

describe User do
  let(:user) { FactoryGirl.build(:user) }

  describe "validations" do
    it { should validate_presence_of :email }
    it { should validate_presence_of :auth_token }
    it { should validate_presence_of :first_name }
    it { should allow_value("test@example.com").for(:email) }
    it { should_not allow_value("testexample.com").for(:email) }
    it { should ensure_length_of(:password).is_at_least(8).is_at_most(50) }
    it { should validate_uniqueness_of :email }
    it { should have_secure_password }
  end

  it_behaves_like "has authentication concerns", User
end
