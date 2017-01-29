usage_and_la:
	@ls -la
	@echo "usage: make [install]"
install:
	ln -sf ${PWD}/vimrc               ~/.vimrc
	ln -sf ${PWD}/gitconfig           ~/.gitconfig
	ln -sf ${PWD}/zshrc               ~/.zshrc
	ln -sf ${PWD}/zprofile            ~/.zprofile
