marker "recipe_start_rightscale" do
  template "rightscale_audit_entry.erb"
end

directory '/mnt/docker' do
  owner "root"
  group "root"
  mode "0755"
  action :create
end

docker_image 'library/wordpress'

docker_container 'library/wordpress' do
  detach true
  port '80:80'
  env 'SETTINGS_FLAVOR=local'
  volume '/mnt/docker:/docker-storage'
  action :run
end
