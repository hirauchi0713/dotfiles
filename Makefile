usage_and_la:
	@ls -la
	@echo "usage: make [install]"
install:
	ln -sf ${PWD}/.bash_profile ~
	ln -sf ${PWD}/.bashrc ~
	ln -sf ${PWD}/.vimrc ~
