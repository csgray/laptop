#
# Cookbook:: laptop
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.

include_recipe 'laptop::nvidia'

package 'git'
package 'bolt'

include_recipe 'laptop::vscode'
