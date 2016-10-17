# PuppetMagnum rspec tests
#
# The following spec tests try to follow the best practices laid
# out on the following websites:
#
# See {http://www.relishapp.com/rspec/rspec-core/v/2-11/docs}
# See {http://betterspecs.org}
#
# @author Tehmasp Chaudhri {mailto:tehmasp@chaudhri.me}
require 'spec_helper'

describe PuppetMagnum do

  context 'when setting up the project root' do
    subject(:puppet_magnum_root) { PuppetMagnum::root }
    it { expect(puppet_magnum_root).to_not be_nil }
    it { expect(puppet_magnum_root.to_s).to match(/puppet-magnum/) }
  end

end
