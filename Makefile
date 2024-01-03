personal: personal.yml
	ansible-playbook \
		-i hosts \
		-e dotfiles=personal \
		-e host_name=scumm \
		-e email=carlotm@protonmail.com \
		--ask-become-pass $<

work: personal.yml
	ansible-playbook \
		-i hosts \
		-e dotfiles=personal \
		-e host_name=monkey \
		-e email=carlo@doloops.net \
		--ask-become-pass $<

mediacenter: mediacenter.yml
	ansible-playbook \
		-i hosts \
		-e dotfiles=mediacenter \
		-e host_name=melee \
		--ask-become-pass $<

.PHONY: personal work mediacenter
