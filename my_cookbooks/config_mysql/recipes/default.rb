mysql_service 'default' do
  port '3306'
  version '5.7'
  initial_root_password 'password'
  action [:create, :start]
  run_user 'ubuntu'
  run_group 'ubuntu'
end
