require 'spec_helper'

RSpec.describe Gistim::Create do
  describe "#create" do
    subject { described_class.new.create }
    let(:gist_url) { 'https://gist.github.com/YumaInaura/4013932bb085c491a7424efb16b1ba2a' } 
    let(:spec_tmp_dir) { './spec/tmp' } 

    before do
      FileUtils.mkdir_p spec_tmp_dir

      # Mock : create new gist in remote
      expect_any_instance_of(Gistim::Create).to receive(:create_empty).at_most(:once).and_return(gist_url)
      expect_any_instance_of(Gistim::Create).to receive(:clone).at_most(:once).and_return(nil)
      allow_any_instance_of(Gistim::Create).to receive(:gist_url).and_return(gist_url)
      allow_any_instance_of(Gistim::Create).to receive(:clone_directory).and_return(spec_tmp_dir)
    end

    it { is_expected.to be_kind_of(described_class) }
  end
end
