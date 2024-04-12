ANSIBLE = ansible-playbook --inventory inventory

workstation: sys.yml vars/workstation.yml
	@$(ANSIBLE) -e machine=$@ $<

chiara:
	@echo TODO

mediacenter:
	@echo TODO

pi:
	@echo TODO
