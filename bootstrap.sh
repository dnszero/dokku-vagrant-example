#!/usr/bin/env bash

vagrant up
vagrant ssh -- "wget -qO- https://raw.github.com/progrium/dokku/v0.2.3/bootstrap.sh | sudo DOKKU_TAG=v0.2.3 bash"

cat ~/.ssh/id_rsa.pub | vagrant ssh -- sudo sshcommand acl-add dokku ${USER}

git remote add dokku dokku@dokku.me:dokku-vagrant-example

make deploy
make test
make logs
