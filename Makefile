scumm: personal.yml
	ansible-galaxy collection install kewlfft.aur
	ansible-playbook \
		-e host=$@ \
		-e email=carlotm@protonmail.com \
		--ask-become-pass $<

monkey: personal.yml
	ansible-galaxy collection install kewlfft.aur
	ansible-playbook \
		-e host=$@ \
		-e email=carlo@doloops.net \
		--ask-become-pass $<
