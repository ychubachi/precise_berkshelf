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
          rubies: ["2.1.2", "2.1.3"],
          global: "2.1.2",
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
