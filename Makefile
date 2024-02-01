personal:
	ansible-playbook \
		-i inventory \
		-e dotfiles=personal \
		--ask-become-pass \
		personal.yml

work: personal.yml
	ansible-playbook \
		-i inventory \
		-e dotfiles=personal \
		--ask-become-pass \
		personal.yml

mediacenter:
	ansible-playbook \
		-i inventory \
		-e dotfiles=mediacenter \
		-e host_name=melee \
		--ask-become-pass \
		mediacenter.yml

.PHONY: personal work mediacenter
