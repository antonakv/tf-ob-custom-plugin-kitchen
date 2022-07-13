describe bash('cd /vagrant && terraform output -raw external_ip') do
    it { should_not match '0.0.0.0'}
    it { should_not match '127.0.0.1'}
end
