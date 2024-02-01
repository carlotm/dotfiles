INV = --inventory $(abspath ./inventory)
ASK = --ask-become-pass
ANSIBLE = ansible-playbook $(INV) $(ASK)

scumm:
	$(ANSIBLE) -e hostname=$@ plays/sys.yml

monkey:
	$(ANSIBLE) -e hostname=$@ plays/sys.yml

dots:
	$(ANSIBLE) plays/dots.yml

.PHONY: scumm monkey dots
