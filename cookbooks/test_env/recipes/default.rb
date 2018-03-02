mysql_service 'default' do
  initial_root_password
  action [:create, :start]
end

mysql_client 'default' do
  action :create
end


rbenv_system_install 'system'
rbenv_user_install 'vagrant'

rbenv_plugin 'ruby-build' do
  git_url 'https://github.com/rbenv/ruby-build.git'
  user 'vagrant'
end

rbenv_ruby '2.1.10' do
  user 'vagrant'
end

rbenv_gem 'bundler' do
	user 'vagrant'
	rbenv_version '2.1.10'
end

rbenv_ruby '2.1.3' do
  user 'vagrant'
end

rbenv_gem 'bundler' do
	user 'vagrant'
	rbenv_version '2.1.3'
end

rbenv_ruby '2.1.2' do
  user 'vagrant'
end

rbenv_gem 'bundler' do
	user 'vagrant'
	rbenv_version '2.1.2'
end

# node.default['pyenv']['user_installs'] = [
#   {
#     'user'     => 'ubuntu',
#     'pythons'  => ['2.7.12'],
#     'global'   => '2.7.12',
#   }
# ]
