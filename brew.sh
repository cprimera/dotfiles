#!/usr/bin/env bash

brew update

brew upgrade --all

brew install findutils
brew install wget --with-iri

brew install bfg
brew install binutils
brew install binwalk
brew install dex2jar
brew install nmap
brew install md5deep
brew install minicom
brew install p7zip
brew install unrar
brew install tree

brew install git
brew install git-lfs
brew install git-flow
brew install imagemagick --with-webp --with-x11
brew install lynx
brew install pv
brew install rename
brew install speedtest_cli
brew install ssh-copy-id
brew install webkit2png
brew install gnuplot --with-x11 --with-latex
brew install ffmpeg --with-x265 --with-libbluray --with-ffplay --with-faac --with-libass --with-libssh --with-openssl
brew install xz

brew install cowsay
brew install cmatrix
brew install rbenv
brew install sqlite
brew install youtube-dl

brew cleanup
