# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = '2'

Vagrant.require_version '>= 1.5.0'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = 'chef/ubuntu-14.04'

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
          rubies: ["2.2.2", "2.1.6"],
          global: "2.2.2",
        }]
      },
      emacs: {
        package: ["emacs24"]
      },
      locale: {
        lang: "ja_JP.utf8",
        lc_all: "ja_JP.utf8",
      },
      postgresql: {
        users: [
          {
            username: "vagrant",
            password: "vagrant",
            superuser: true,
            createdb: true,
            login: true
          }
        ],
        databases: [
           {
             name: "vagrant",
             owner: "vagrant",
             template: "template0",
             encoding: "UTF-8",
             locale: "ja_JP.utf-8",
             extensions: "hstore"
           }
         ]
      }
    }

    chef.run_list =
      [
       "enpit",
       "apt",
       "locale",
       "git",
       "zsh",
       "enpit::emacs24",
       "vim",
       "postgresql",
       "postgresql::server",
       "postgresql::client",
       "postgresql::libpq",
       "ruby_build",		# an rbenv plugin
       "rbenv::user",
       "heroku-toolbelt",
       "enpit::github-connect",
       "enpit::generate_rails",
       "enpit::bash_profile",
       "enpit::gemrc",
       "enpit::gitconfig",
      ]
  end
end
