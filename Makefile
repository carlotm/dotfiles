personal: scumm.yml
	ansible-playbook \
		-i hosts \
		-e kind=personal \
		-e target_hostname=scumm \
		-e email=carlotm@protonmail.com \
		--ask-become-pass $<

work: scumm.yml
	ansible-playbook \
		-i hosts \
		-e kind=personal \
		-e target_hostname=monkey \
		-e email=carlo@doloops.net \
		--ask-become-pass $<

mediacenter: melee.yml
	ansible-playbook \
		-i hosts \
		-e kind=$@ \
		-e target_hostname=melee \
		--ask-become-pass $<
