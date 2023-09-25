.PHONY: scumm melee monkey

scumm: scumm.yml
	ansible-playbook --ask-become-pass $<

melee: melee.yml
	ansible-playbook --ask-become-pass $<

monkey: monkey.yml
	ansible-playbook --ask-become-pass $<
