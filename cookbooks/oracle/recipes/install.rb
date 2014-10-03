directory "/u02/oradata/#{node[:sid]}" do
  owner "oracle"
  group "dba"
  mode "0744"
  recursive true
end

directory "/u01/app/oracle/admin/#{node[:sid]}/adump" do
  owner "oracle"
  group "dba"
  mode "0744"
  recursive true
end

directory "/u01/app/oracle/admin/#{node[:sid]}/dpdump" do
  owner "oracle"
  group "dba"
  mode "0744"
  recursive true
end

execute "chown_u01" do
  command "chown -R oracle:dba /u01"
  user "root"
end

execute "chown_u02" do
  command "chown -R oracle:dba /u02"
  user "root"
end

template "/u01/app/oracle/product/11.2.0/dbhome_1/dbs/init#{node[:sid]}.ora" do
  owner "oracle"
  group "dba"
  mode "0644"
  source "init.ora.erb"
end

remote_directory "/u02/oradata/#{node[:sid]}" do
  files_owner 'oracle'
  owner 'oracle'
  group 'dba'
  source "#{node[:sid]}"
end

execute "gunzip" do 
  command "gunzip *.gz"
  user "oracle"
  cwd "/u02/oradata/#{node[:sid]}"
end

template "/etc/oratab" do
  mode "0644"
  owner "oracle"
  group "dba"
  source "oratab.erb"
end

#template "/u02/oradata/#{node[:sid]}/createdb.sql" do
#  mode "0644"
#  owner "oracle"
#  group "dba"
#  source "createdb.sql.erb"
#end

template "/u02/oradata/#{node[:sid]}/createdb.sh" do
  mode "0755"
  owner "oracle"
  group "dba"
  source "createdb.sh.erb"
end

template "/u01/app/oracle/product/11.2.0/dbhome_1/network/admin/listener.ora" do
  owner "oracle"
  group "dba"
  source "listener.ora.erb"
end  

execute "install" do 
  command "su -l -c 'cd /u02/oradata/#{node[:sid]} && ./createdb.sh' oracle"
  user "root"
end

template "/etc/init.d/oracle" do 
  source "oracle.erb"
end

execute "chmod_oracle" do 
  command "chmod +x /etc/init.d/oracle"  
  user "root"
end

execute "chkconfig" do 
  command "chkconfig --add oracle"
  user "root"
end