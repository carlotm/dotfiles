ANSIBLE = ansible-playbook
TARGET ?= localhost

workstation: sys.yml vars/workstation.yml
	$(ANSIBLE) \
		--inventory="$(TARGET)," \
		-e machine=$@ \
		-e target=$(TARGET) \
		$<

mediacenter: sys.yml vars/mediacenter.yml
	$(ANSIBLE) \
		--inventory="$(TARGET)," \
		-e machine=$@ \
		-e target=$(TARGET) \
		$<
