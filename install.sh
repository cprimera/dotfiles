populate () {
	cd ~/dotfiles
	git submodule init
	git submodule update
	for i in *
	do
		if [ "$i" != "README.md" ] && [ "$i" != "install.sh" ] && [ "$i" != "6226629" ]
		then
			ln -s ~/dotfiles/$i ~/.${i}
		fi
	done
	ln -s ~/dotfiles/6226629/cprimera.zsh-theme ./oh-my-zsh/themes/cprimera.zsh-theme
}

if [ "$1" == "--local" ] || [ "$1" == "-l" ]
then
	populate
else
	git clone https://github.com/cprimera/dotfiles ~/dotfiles
	populate
fi
