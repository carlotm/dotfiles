.PHONY: scumm

scumm: scumm.yml
	ansible-playbook --ask-become-pass $<
