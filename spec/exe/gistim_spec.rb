require 'spec_helper'

RSpec.describe do
  subject { `gistim --help` }
  it { is_expected.to include 'gistim' }
end
