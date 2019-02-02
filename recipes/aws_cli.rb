#
# Cookbook:: laptop
# Recipe:: aws_cli
#
# Copyright:: 2019, The Authors, All Rights Reserved.

package 'python3'

execute 'install_aws_cli' do
  command 'pip install awscli --upgrade'
end
