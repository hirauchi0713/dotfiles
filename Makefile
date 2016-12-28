ifndef HOST_NICKNAME
error_and_la:
	@ls -la
	@echo "error: please export HOST_NICKNAME"
else
usage_and_la:
	@ls -la
	@echo "usage: make [install]"
install:
	cp \
		.bash_profile \
		.bashrc \
		.vimrc \
		${HOME}
	echo 'export PS1="(${HOST_NICKNAME}) \W $$ "' >> ~/.bash_profile
	echo 'export HOST_NICKNAME=${HOST_NICKNAME}' >> ~/.bash_profile
endif
