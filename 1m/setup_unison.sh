#!/bin/bash
cd $HOME/tmp
wget https://github.com/bcpierce00/unison/releases/download/v2.53.0/unison-v2.53.0+ocaml-4.14.0+x86_64.linux.tar.gz
tar -xf unison-v2.53.0+ocaml-4.14.0+x86_64.linux.tar.gz
$HOME/bin/sudo.sh mv bin/uni* /usr/bin/
