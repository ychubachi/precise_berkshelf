bash "install hub" do
  not_if 'which hub'
  user "root"
  cwd "/tmp"
  code <<-BASH
  wget -q https://github.com/github/hub/releases/download/v2.2.3/hub-linux-386-2.2.3.tgz
  tar zxvf hub-linux-386-2.2.3.tgz
  cp ./hub-linux-386-2.2.3/bin/hub /usr/local/bin
  rm -rf hub-linux-386-2.2.3*
  BASH
  action :run
end
