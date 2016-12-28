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
	echo 'export PS1="(${HOST_NICKNAME}) \W $$ "' >> ~/.bash_profile
endif
