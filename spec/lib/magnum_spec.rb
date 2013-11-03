# Magnum rspec tests
#
# The following spec tests try to follow the best practices laid
# out on the following websites:
#
# See {http://www.relishapp.com/rspec/rspec-core/v/2-11/docs}
# See {http://betterspecs.org}
#
# @author Tehmasp Chaudhri {mailto:tehmasp@gmail.com}
require 'spec_helper'

describe Magnum do

  context 'when setting up the project root' do
    subject(:magnum_root) { Magnum::root }
    it { expect(magnum_root).to_not be_nil }
    it { expect(magnum_root.to_s).to match(/magnum/) }
  end

end
