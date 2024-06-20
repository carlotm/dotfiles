TARGET ?= undefined
ANSIBLE = ansible-playbook -u root

ifdef LOCAL
	CONN = --connection=local
else
	CONN =
endi

%: sys.yml vars/%.yml
	$(ANSIBLE) --inventory="$(TARGET)," $(CONN) -e profile=$@ $<
