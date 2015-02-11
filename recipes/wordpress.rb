marker "recipe_start_rightscale" do
  template "rightscale_audit_entry.erb"
end

directory '/mnt/docker' do
  owner "root"
  group "root"
  mode "0755"
  action :create
end

docker_image 'mysql' do
  cmd_timeout 1800
  action :pull
end

docker_image 'wordpress' do
  cmd_timeout 1800
  action :pull
end

docker_container 'mysql' do
  detach true
  port '3306:3306'
  env 'MYSQL_ROOT_PASSWORD=wordpress'
  volume '/mnt/docker:/docker-storage'
  action :run
end

docker_container 'wordpress' do
  detach true
  port '80:80'
  env 'WORDPRESS_DB_NAME=wordpress'
  volume '/mnt/docker:/docker-storage'
  link 'mysql'
  action :run
end
