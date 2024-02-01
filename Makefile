INV = --inventory $(abspath ./inventory)
ASK = --ask-become-pass
ANSIBLE = ansible-playbook $(INV) $(ASK)

scumm:
	$(ANSIBLE) -e hostname=$@ plays/sys.yml

monkey:
	$(ANSIBLE) -e hostname=$@ plays/sys.yml

mediacenter:
	ansible-playbook \
		-i inventory \
		-e dotfiles=mediacenter \
		-e host_name=melee \
		--ask-become-pass \
		mediacenter.yml

.PHONY: mediacenter scumm monkey
