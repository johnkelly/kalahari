shared_examples "has authentication concerns" do |klass|
  describe "self.secure_compare" do
    context "true" do
      it "compares two values" do
        klass.secure_compare("apple", "apple").should be_true
      end
    end

    context "false" do
      it "compares two values" do
        klass.secure_compare("apples", "apple").should be_false
      end
    end
  end

  describe "self.generate_authentication_token" do
    before do
      allow(klass).to receive(:generate_token).and_return("faketoken")
      expect(klass.generate_authentication_token).to eq("faketoken")
    end
    it { expect(klass).to have_received(:generate_token).with(:auth_token) }
  end
end
