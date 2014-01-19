require 'spec_helper_system'

describe 'basic tests:' do
  it 'my class should work with no errors' do
    shell('puppet module install puppetlabs/stdlib --version ">= 0.1.6"')
    shell('puppet module install stahnma/epel --version ">= 0.0.6"')

    pp = <<-EOS
      class { 'opsview_server': }
    EOS

    # Run it twice and test for idempotency
    puppet_apply(pp) do |r|
      r.exit_code.should_not == 1
      r.refresh
      r.exit_code.should be_zero
    end
  end
end