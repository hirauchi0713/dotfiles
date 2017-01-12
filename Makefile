usage_and_la:
	@ls -la
	@echo "usage: make [install]"
install:
	ln -sf ${PWD}/bash_profile ~/.bash_profile
	ln -sf ${PWD}/bashrc ~/.bashrc
	ln -sf ${PWD}/vimrc ~/.vimrc
	ln -sf ${PWD}/gitconfig ~/.gitconfig
