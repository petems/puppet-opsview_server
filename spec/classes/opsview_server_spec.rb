require 'spec_helper'

describe 'opsview_server' do

  ['RedHat'].each do |system|
    if system == 'Gentoo (Facter < 1.7)'
      let(:facts) {{ :osfamily => 'Linux', :operatingsystem => 'Gentoo' }}
    else
      let(:facts) {{ :osfamily => system }}
    end

    it { should contain_class('opsview_server::config') }
    it { should contain_class('opsview_server::package') }
    it { should contain_class('opsview_server::service') }

  end

end



