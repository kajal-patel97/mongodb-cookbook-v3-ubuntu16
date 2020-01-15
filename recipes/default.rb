#
# Cookbook:: mongodb_cookbook_v3_ubuntu16
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.
include_recipe 'apt'

execute 'mongodb_apt_key' do
  command 'sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6'
  action :run
end

execute 'mongodb_sourcelist' do
  command "echo 'deb [ arch=amd64,arm64 ] http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.4 multiverse' | sudo tee "
  action :run
end

execute 'apt-update' do
  command 'sudo apt-get update -y'
  action :run
end

execute 'mongodb_install' do
  command 'sudo apt-get install -y mongodb-org'
  action :run
end

execute 'restart_mongod' do
  command 'sudo systemctl restart mongod'
  action :run
end

execute 'enable_mongod'do
  command 'sudo systemctl enable mongod'
  action :run
end
