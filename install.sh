populate () {
	cd ~/dotfiles
	for i in *
	do
		if [ "$i" != "README.md" ] && [ "$i" != "install.sh" ]
		then
			ln -s ~/dotfiles/$i ~/.${i}
		fi
	done
}

install_ohmyzsh () {
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
	curl -fsSL https://gist.githubusercontent.com/cprimera/6226629/raw/0e9cd73e48d2a967ead3514aaaba187242eff48b/cprimera.zsh-theme > ~/.oh-my-zsh/themes/cprimera.zsh-theme
}

if [ "$1" != "--local" ] && [ "$1" != "-l" ]
then
	git clone https://github.com/cprimera/dotfiles ~/dotfiles
fi

populate
install_ohmyzsh
brew bundle install
