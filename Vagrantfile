# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty32"

  config.vm.network "private_network", ip: "192.168.33.10"
  config.vm.network "forwarded_port", guest: 3000, host: 3000
  config.vm.hostname = "enpit"

  config.omnibus.chef_version = :latest

  config.berkshelf.enabled = true

  config.vm.provision :chef_solo do |chef|
    chef.json = {
      rbenv: {
        user_installs: [{
          user: "vagrant",
          rubies: ["2.1.2"],
          global: "2.1.2",
        }]
      },
      emacs: {
        package: ["emacs24"]
      },
      locale: {
        lang: "ja_JP.utf8",
        lc_all: "ja_JP.utf8",
      }
    }

    chef.run_list =
      [
       "enpit",
       "apt",
       "locale",
       "git",
       "vim",
       "zsh",
       "enpit::emacs24",
       "heroku-toolbelt",
       "ruby_build",		# an rbenv plugin
       "rbenv::user",
       "enpit::github-connect",
       "enpit::generate_rails",
      ]
  end
end
