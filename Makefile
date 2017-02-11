usage_and_la:
	@ls -la
	@echo "usage: make [install]"
install:
	ln -snf ${PWD}/vimrc                        ~/.vimrc
	ln -snf ${PWD}/gitconfig                    ~/.gitconfig
	ln -snf ${PWD}/zshrc                        ~/.zshrc
	ln -snf ${PWD}/zprofile                     ~/.zprofile
	ln -snf ${PWD}/config                       ~/.config
	ln -snf ${PWD}/iterm2                       ~/.iterm2
	ln -snf ${PWD}/iterm2_shell_integration.zsh ~/.iterm2_shell_integration.zsh
