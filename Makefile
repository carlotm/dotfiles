ANSIBLE = ansible-playbook -u root

ifdef LOCAL
	CONN = --connection=local
	TARGET = localhost
else
	CONN =
	TARGET = undefined
endif

%: sys.yml vars/%.yml
	$(ANSIBLE) --inventory="$(TARGET)," $(CONN) -e profile=$@ $<
