require 'spec_helper_system'

describe 'basic tests:' do
  it 'my class should work with no errors' do
    shell('puppet module install puppetlabs/stdlib --version ">= 0.1.6"')
    shell('puppet module install stahnma/epel --version ">= 0.0.6"')
    shell('puppet module install puppetlabs/apt --version ">= 1.4.0"')

    pp = <<-EOS
      class { 'opsview_server': }
    EOS

    puppet_apply(:code => pp, :debug => true) do |r|
      r.exit_code.should_not == 1
    end

  end
end