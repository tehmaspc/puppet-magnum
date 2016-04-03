require 'spec_helper'

describe PuppetMagnum::BaseGenerator do

  context 'when setting up the project template root' do
    subject(:magnum_source_root) { PuppetMagnum::BaseGenerator.source_root }
    it { expect(magnum_source_root).to_not be_nil }
    it { expect(magnum_source_root.to_s).to match(/generator_files/) }
  end

end
