usage_and_la:
	@ls -la
	@echo "usage: make [install]"
install:
	ln -sf ${PWD}/bash_profile        ~/.bash_profile
	ln -sf ${PWD}/bashrc              ~/.bashrc
	ln -sf ${PWD}/vimrc               ~/.vimrc
	ln -sf ${PWD}/gitconfig           ~/.gitconfig
	ln -sf ${PWD}/zshrc               ~/.zshrc
	ln -sf ${PWD}/zprofile            ~/.zprofile
	ln -sf ${PWD}/zshrc.pre-oh-my-zsh ~/.zshrc.pre-oh-my-zsh
