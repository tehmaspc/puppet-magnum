require 'spec_helper'
require 'sem_ver'

describe Magnum::Cli do

  context 'when requesting the version number' do
    subject(:version) { Magnum::VERSION }
    it { expect(version).to_not be_nil }
    it { expect(SemVer.parse(version).valid?).to be_truthy }
  end

  context 'when printing version, author, and license information' do
    subject(:cli) { Magnum::Cli.new }
    it { expect(cli).to be }
    it { expect(cli.version.to_s).to be }
  end

end
