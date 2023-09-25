.PHONY: scumm melee monkey

scumm: scumm.yml
	ansible-playbook -e host=scumm --ask-become-pass $<

monkey: monkey.yml
	ansible-playbook -e host=monkey --ask-become-pass $<

melee: melee.yml
	ansible-playbook --ask-become-pass $<

