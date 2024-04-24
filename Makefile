ANSIBLE = ansible-playbook
TARGET ?= localhost

workstation: sys.yml vars/workstation.yml
	$(ANSIBLE) --inventory="$(TARGET)," -e profile=$@ $<

mediacenter: sys.yml vars/mediacenter.yml
	$(ANSIBLE) --inventory="$(TARGET)," -e profile=$@ $<
