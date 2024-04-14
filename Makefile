ANSIBLE = ansible-playbook --inventory inventory

workstation: sys.yml vars/workstation.yml
	@$(ANSIBLE) -e machine=$@ $<

chiara:
	@echo TODO

mediacenter: sys.yml vars/mediacenter.yml
	@$(ANSIBLE) -e machine=$@ -e target=192.168.1.103 $<

pi:
	@echo TODO
