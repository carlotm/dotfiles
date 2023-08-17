.PHONY: all clean

all: clean ansible dotfiles

clean:
	stow -D home

dotfiles: home
	stow $<

ansible: system
	cd $< && ansible-playbook --ask-become-pass setup.yml
