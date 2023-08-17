.PHONY: all clean ansible

all: clean ansible

ansible: system
	cd $< && ansible-playbook --ask-become-pass setup.yml
