#
# Cookbook Name:: basic-lemr-stack
# Recipe:: default
#
# Copyright (c) 2015 Matt Stratton, All Rights Reserved.

include_recipe 'rbenv::default'
include_recipe 'rbenv::ruby_build'

# Use the following for each version of ruby you want to install. If you want to get slick later you can set this as an array of attributes and spin through it all fancy-like
rbenv_ruby '1.9.3-p327'
rbenv_ruby '2.0.0-p247'

# The following line will include the basic install of nginx. If you want to change the defaults, add the attributes to this cookbook as overrides in the attributes/default.rb file. All the possible attributes are at https://supermarket.chef.io/cookbooks/nginx
include_recipe 'nginx::default'

# Install and configure mysql. Note that this can get pretty complex, so you'll likely want to do a bunch more than just these simple defaults. For details, check out https://supermarket.chef.io/cookbooks/mysql

mysql_service 'default' do
  version '5.7'
  bind_address '0.0.0.0'
  port '3306'
  data_dir '/data'
  initial_root_password 'Ch4ng3me'
  action [:create, :start]
end

mysql_client 'default' do
  action :create
end

# Installs the atom text editor

include_recipe 'atom::default'

# Install 'lychee-theme'

atom_apm 'lychee-theme'
