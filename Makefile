ANSIBLE = ansible-playbook
INVENTORY = --inventory inventory

workstation: sys.yml vars/workstation.yml
	@$(ANSIBLE) -e machine=$@ $<

chiara:
	@echo TODO

mediacenter:
	@echo TODO

pi:
	@echo TODO
