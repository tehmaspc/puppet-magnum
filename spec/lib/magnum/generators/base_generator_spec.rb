require 'spec_helper'

describe Magnum::BaseGenerator do

  context 'when setting up the project template root' do
    subject(:magnum_source_root) { Magnum::BaseGenerator.source_root }
    it { expect(magnum_source_root).to_not be_nil }
    it { expect(magnum_source_root.to_s).to match(/generator_files/) }
  end

end
