template "/root/zerofree.sh" do
  owner "root"
  group "root"
  mode "0755"
  source "zerofree.sh.erb"
end

#execute "zerofree" do
#  command "./zerofree.sh"
#  cwd "/root"
#  user "root"
#end