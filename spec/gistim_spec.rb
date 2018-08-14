RSpec.describe Gistim do
  describe 'class loading' do
    subject { -> { described_class } }
    it { is_expected.to_not raise_error }
  end
end
