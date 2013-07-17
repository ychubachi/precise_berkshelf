if platform?('ubuntu') && node['platform_version'].to_f < 12.10
  apt_repository "emacs24-ppa" do
    uri "http://ppa.launchpad.net/cassou/emacs/ubuntu"
    distribution node['lsb']['codename']
    components ['main']
    keyserver "keyserver.ubuntu.com"
    key "CEC45805"
  end
elsif platform?("debian")
  apt_repository "emacs24-snapshot" do
    uri "http://emacs.naquadah.org"
    distribution "unstable/"
    components []
    key "http://emacs.naquadah.org/key.gpg"
  end
end

package "emacs24-nox" do
  package_name "emacs-snapshot-nox" if platform?('debian')
end

package "emacs24-el" do
  package_name "emacs-snapshot-el" if platform?('debian')
end
