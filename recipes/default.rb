#
# Cookbook:: laptop
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.

package 'git'
package 'bolt'

include_recipe 'laptop::nvidia'
include_recipe 'laptop::vscode'
include_recipe 'laptop::backgrounds'
