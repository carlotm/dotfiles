ANSIBLE = ansible-playbook --inventory inventory
TARGET ?= scumm

.PHONY: sys scumm

sys:
	$(ANSIBLE) $(EXTRA) -e hostname=$(TARGET) plays/sys.yml

scumm:
	sudo make sys
	sudo $(ANSIBLE) plays/dots.yml
