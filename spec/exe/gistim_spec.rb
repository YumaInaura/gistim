require 'spec_helper'

RSpec.describe do
  describe '--help' do
    subject { `gistim --help` }
    it { is_expected.to include 'gistim' }
  end

  describe '--version' do
    subject { `gistim --version`.chomp }
    it { is_expected.to eq Gistim::VERSION }
  end
end
