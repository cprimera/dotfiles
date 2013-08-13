git clone https://github.com/cprimera/dotfiles /home/`whoami`/dotfiles
cd /home/`whoami`/dotfiles
for i in *
do
	if [ "$i" != "README.md" ] && [ "$i" != "install.sh" ]
	then
		ln -s $i /home/`whoami`/.${i}
	fi
done
