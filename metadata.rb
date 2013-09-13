name             'precise'
maintainer       'Yoshihide Chubachi'
maintainer_email 'yoshi@chubachi.net'
license          'All rights reserved'
description      'Installs/Configures precise for enPiT'
# long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends 'locale', github: "hw-cookbooks/locale"
depends 'apt'
depends 'zsh'
depends 'git'
depends 'vim'
depends 'emacs', github: "mattray/emacs"
depends 'ruby_build'
depends 'rbenv', github: "fnichol/chef-rbenv"
depends 'nodejs'
depends 'hub', github: "drnic/chef-hub"
