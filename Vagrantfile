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
          gems: {
            "2.1.2" => [
                             {name: "bundler"},
                             {name: "rails"},
                             {name: "travis"},
            ]
          }
        }]
      },
      emacs: {
        package: ["emacs24"]
      },
      locale: {
        lang: "ja_JP.utf8"
      }
    }

    chef.run_list =
      [
       "enpit",
       "apt",
       "enpit::language-pack-ja",
       "enpit::shift_jis",
       "enpit::env",
       "locale",
       "git",
       "vim",
       "zsh",
       "enpit::emacs24",
       "heroku-toolbelt",
#       "hub",
       "ruby_build",
       "rbenv::user",
       "nodejs",
       "enpit::github-connect",
      ]
  end
end
