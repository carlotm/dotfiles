scumm: personal_system.yml
	ansible-playbook -e host=scumm --ask-become-pass $<

monkey: personal_system.yml
	ansible-playbook -e host=monkey --ask-become-pass $<
