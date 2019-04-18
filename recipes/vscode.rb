#
# Cookbook:: laptop
# Recipe:: vscode
#
# Copyright:: 2019, The Authors, All Rights Reserved.

apt_repository 'code' do
  arch 'amd64'
  components %w(stable main)
  keyserver 'https://packages.microsoft.com/keys/microsoft.asc'
  trusted true
  uri 'https://packages.microsoft.com/repos/vscode'
  only_if { platform_family?('debian') }
end

yum_repository 'code' do
  description 'Visual Studio Code'
  baseurl 'https://packages.microsoft.com/yumrepos/vscode'
  gpgkey 'https://packages.microsoft.com/keys/microsoft.asc'
  only_if { platform_family?('rhel') || platform_family?('fedora') }
end

package 'apt-transport-https' do
  only_if { platform_family?('debian') }
end

package %w(code ruby ruby-devel)
gem_package 'rubocop'
