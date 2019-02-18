#
# Cookbook:: laptop
# Recipe:: virtualization
#
# Copyright:: 2019, The Authors, All Rights Reserved.

package %w(virt-install libvirt-daemon-config-network libvirt-daemon-kvm qemu-kvm virt-manager virt-viewer guestfs-browser libguestfs-tools python3-libguestfs virt-top)

service 'libvirtd' do
  action :enable
end
