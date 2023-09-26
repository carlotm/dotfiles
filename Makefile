scumm: personal_system.yml
	ansible-playbook -e host=$@ --ask-become-pass $<

monkey: personal_system.yml
	ansible-playbook -e host=$@ --ask-become-pass $<
