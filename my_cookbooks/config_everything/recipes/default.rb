mysql_service 'instance' do
  port '3306'
  version '5.7'
  initial_root_password 'password'
  action [:create, :start]
end

mysql_client 'default' do
  action :create
end

#rbenv_system_install 'system'
rbenv_user_install 'ubuntu'

rbenv_plugin 'ruby-build' do
  git_url 'https://github.com/rbenv/ruby-build.git'
  user 'ubuntu'
end

rbenv_ruby '2.1.10' do
  user 'ubuntu'
end

rbenv_ruby '2.1.3' do
  user 'ubuntu'
end

rbenv_ruby '2.1.2' do
  user 'ubuntu'
end

rbenv_global '2.1.10' do
  user 'ubuntu'
end

node.default['pyenv']['user_installs'] = [
  {
    'user'     => 'ubuntu',
    'pythons'  => ['2.7.12'],
    'global'   => '2.7.12',
  }
]
