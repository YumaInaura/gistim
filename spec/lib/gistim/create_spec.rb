RSpec.describe Gistim::Create do
  describe "#clone" do
    subject { described_class.new.create }
    let(:gist_url) { 'https://gist.github.com/YumaInaura/4013932bb085c491a7424efb16b1ba2a' } 

    before do
      # Mock : create new gist in remote
      expect_any_instance_of(Gistim::Create).to receive(:create_empty).at_most(:once).and_return(gist_url)
      expect_any_instance_of(Gistim::Create).to receive(:clone).at_most(:once).and_return(nil)
    end

    it { is_expected.to be_kind_of(described_class) }
  end
end
