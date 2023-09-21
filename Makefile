.PHONY: scumm melee

scumm: scumm.yml
	ansible-playbook --ask-become-pass $<

melee: melee.yml
	ansible-playbook --ask-become-pass $<
