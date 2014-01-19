require 'spec_helper'

describe 'opsview_server::package', :type => :class  do

  ['RedHat'].each do |system|
    if system == 'Gentoo (Facter < 1.7)'
      let(:facts) {{ :osfamily => 'Linux', :operatingsystem => 'Gentoo' }}
    else
      let(:facts) {{ :osfamily => system }}
    end

    it { should contain_package('opsview') }

  end

end



