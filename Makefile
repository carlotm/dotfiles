scumm: scumm.yml
	ansible-playbook \
		-e username=carloratm \
		-e host=$@ \
		-e email=carlotm@protonmail.com \
		--ask-become-pass $<

melee: melee.yml
	ansible-playbook \
		-e username=gianfranco \
		-e host=$@ \
		--ask-become-pass $<
