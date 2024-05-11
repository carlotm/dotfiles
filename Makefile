TARGET ?= localhost

%: sys.yml vars/%.yml
	ansible-playbook -u root --inventory="$(TARGET)," -e profile=$@ $<
