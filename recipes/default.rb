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

include_recipe 'laptop::nvidia'
include_recipe 'laptop::vscode'
include_recipe 'laptop::backgrounds'
include_recipe 'laptop::aws_cli'
