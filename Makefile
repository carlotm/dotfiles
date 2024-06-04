TARGET ?= undefined

%: sys.yml vars/%.yml
	ansible-playbook -u root --inventory="$(TARGET)," -e profile=$@ $<
