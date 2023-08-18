.PHONY: all clean ansible

all: clean ansible

ansible:
	ansible-playbook --ask-become-pass setup.yml
