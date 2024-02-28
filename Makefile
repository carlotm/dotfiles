ansible = ansible-playbook --inventory inventory --ask-become-pass

.PHONY: scumm

scumm:
	$(ansible) -e hostname=scumm plays/sys.yml
	$(ansible) plays/dots.yml
