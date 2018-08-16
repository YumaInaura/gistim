require 'spec_helper'

RSpec.describe Gistim do
  describe 'module loading' do
    subject { -> { described_class } }
    it { is_expected.to_not raise_error }
  end

  describe 'sub class loading' do
    subject { -> { Gistim::Create } }
    it { is_expected.to_not raise_error }
  end
end
