scumm: personal.yml
	ansible-playbook \
		-e system=personal \
		-e email=carlotm@protonmail.com \
		--ask-become-pass $<

monkey: personal.yml
	ansible-playbook \
		-e host=$@ \
		-e email=carlo@doloops.net \
		--ask-become-pass $<
