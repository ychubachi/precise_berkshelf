# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty32"

  config.vm.network "private_network", ip: "192.168.33.10"
  config.vm.network "forwarded_port", guest: 3000, host: 3000
  config.vm.hostname = "enpit"

  config.omnibus.chef_version = :latest

  config.berkshelf.enabled = true

  # An array of symbols representing groups of cookbook described in the Vagrantfile
  # to exclusively install and copy to Vagrant's shelf.
  # config.berkshelf.only = []

  # An array of symbols representing groups of cookbook described in the Vagrantfile
  # to skip installing and copying to Vagrant's shelf.
  # config.berkshelf.except = []

  config.vm.provision :chef_solo do |chef|
    chef.json = {
      rbenv: {
        user_installs: [{
          user: "vagrant",
          rubies: ["2.0.0-p247"],
          global: "2.0.0-p247",
          gems: {
            "2.0.0-p247" => [
                             {name: "bundler"},
                             {name: "rails"},
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
       "precise",
       "apt",
       "precise::language-pack-ja",
       "precise::shift_jis",
       "precise::env",
       "locale",
       "git",
       "vim",
       "zsh",
       "precise::emacs24",
       "precise::heroku",
#       "hub",
       "ruby_build",
#       "rbenv::user",
       "nodejs",
      ]
  end
end
