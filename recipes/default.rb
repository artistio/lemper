#
# Cookbook:: lemper
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.


apt_update 'updateapt' do
  # for development purpose, use the one below
  #action :update

  # for production purpose, use the one below to update daily
  frequency 86400
  action :periodic
end

# Install mariadb
# Installation attribute is in directory attribute/
include_recipe 'mariadb::default'

# Install nginx
# Installation attribute is in directory attribute/
include_recipe 'nginx::default'

# Install php
include_recipe 'php::default'
# Install a FPM pool named "default"
php_fpm_pool 'lemper' do
  action :install
end
