scumm: scumm.yml
	ansible-playbook \
		-i hosts \
		-e username=carloratm \
		-e host=$@ \
		-e email=carlotm@protonmail.com \
		--ask-become-pass $<

monkey: monkey.yml
	ansible-playbook \
		-i hosts \
		-e username=carloratm \
		-e host=$@ \
		-e email=carlo@doloops.net \
		--ask-become-pass $<

melee: melee.yml
	ansible-playbook \
		-i hosts \
		-e username=gianfranco \
		-e host=$@ \
		--ask-become-pass $<
