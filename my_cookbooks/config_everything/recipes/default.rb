mysql_service 'instance' do
  port '3306'
  version '5.7'
  initial_root_password 'password'
  action [:create, :start]
end

mysql_client 'default' do
  action :create
end

rbenv_system_install 'system'

rbenv_ruby '2.1.10'
rbenv_ruby '2.1.3'

rbenv_global '2.1.10'

rbenv_gem 'bundler' do
  rbenv_version '2.1.10'
end

rbenv_gem 'bundler' do
  rbenv_version '2.1.3'
end
