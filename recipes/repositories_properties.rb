# Creates the file etc/repositories.properties in the wlp dir to configure which repositories are used by installUtility

directory "#{node[:wlp][:base_dir]}/etc" do
  owner node[:wlp][:user]
  group node[:wlp][:group]
  mode '0755'
  action :create
end

file "#{node[:wlp][:base_dir]}/etc/repositories.properties" do
  content "useDefaultRepository=#{node[:wlp][:liberty_repository]} \nhostedRepository.url=#{node[:wlp][:hosted_repository_url]} \nlocalRepository.url=#{node[:wlp][:local_repository_url]}"
  owner 'wlp'
  group 'wlpadmin'
  mode '0644'
  action :create
end
