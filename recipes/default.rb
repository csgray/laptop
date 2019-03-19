#
# Cookbook:: laptop
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.

package 'git'
package 'bolt'

cookbook_file '/home/csgray/.bashrc' do
  source 'bashrc'
  owner 'csgray'
  group 'csgray'
  mode '0644'
end

# Enables Yubikey two-factor authentication
remote_file '/etc/udev/rules.d/70-u2f.rules' do
  source 'https://raw.githubusercontent.com/Yubico/libu2f-host/master/70-u2f.rules'
  owner 'root'
  group 'root'
  mode '0644'
end

include_recipe 'laptop::nvidia'
include_recipe 'laptop::vscode'
include_recipe 'laptop::backgrounds'
include_recipe 'laptop::aws_cli'
include_recipe 'laptop::virtualization'
