#
# Cookbook:: laptop
# Recipe:: nvidia
#
# Copyright:: 2019, The Authors, All Rights Reserved.

# NVIDIA driver requirements
package %w(kernel-devel kernel-headers gcc make dkms acpid libglvnd-glx libglvnd-opengl libglvnd-devel pkgconfig)

file '/etc/modprobe.d/blacklist.conf' do
  content 'blacklist nouveau'
  mode '0644'
  owner 'root'
  group 'root'
  action :create
end

execute 'grub2-mkconfig' do
  command 'grub2-mkconfig -o /boot/efi/EFI/fedora/grub.cfg'
  action :nothing
end

cookbook_file '/etc/sysconfig/grub' do
  source 'grub'
  owner 'root'
  group 'root'
  manage_symlink_source true
  mode '0664'
  action :create
  notifies :run, 'execute[grub2-mkconfig]', :immediately
end

execute 'backup_initramfs' do
  command 'mv /boot/initramfs-$(uname -r).img /boot/initramfs-$(uname -r)-nouveau.img'
  action :nothing
end

execute 'new_initramfs' do
  command 'dracut /boot/initramfs-$(uname -r).img $(uname -r)'
  action :nothing
end

package 'xorg-x11-drv-nouveau' do
  action :remove
  notifies :run, 'execute[backup_initramfs]', :immediately
  notifies :run, 'execute[new_initramfs]', :immediately
end

# Video acceleration support
package %w(vdpauinfo libva-vdpau-driver libva-utils)
