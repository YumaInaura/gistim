require 'spec_helper'

RSpec.describe Gistim::Create do
  describe "#implement" do
    let(:initialize_description) { 'Hello test gistim!' }
    let(:implement) { described_class.new(description: initialize_description).implement }

    let(:gist_url) { 'https://gist.github.com/YumaInaura/4013932bb085c491a7424efb16b1ba2a' } 

    before do
      # Mock : create new gist in remote
      expect_any_instance_of(Gistim::Create).to receive(:create_empty).at_most(:once).and_return(gist_url)
      expect_any_instance_of(Gistim::Create).to receive(:clone).at_most(:once).and_return(nil)
      allow_any_instance_of(Gistim::Create).to receive(:directory).and_return('./spec/tmp')
    end

    describe 'return class instance' do
      subject { implement }
      it { is_expected.to be_kind_of(described_class) }
    end

    describe 'gist_url' do
      subject { implement.url }
      it { is_expected.to eq gist_url }
    end

    describe 'gist_hash' do
      subject { implement.hash }
      it { is_expected.to eq '4013932bb085c491a7424efb16b1ba2a' }
    end

    describe 'description' do
      subject { implement.description }
      it { is_expected.to eq initialize_description }
    end
  end
end
