ANSIBLE = ansible-playbook -u root

XFCONFDOTS = thunar.xml xfce4-desktop.xml xfce4-notifyd.xml xfce4-power-manager.xml xfwm4.xml xsettings.xml          

ifdef LOCAL
	CONN = --connection=local
	TARGET = localhost
else
	CONN =
	TARGET = undefined
endif

%: sys.yml vars/%.yml
	$(ANSIBLE) --inventory="$(TARGET)," $(CONN) -e profile=$@ $<

xfconf:
	cp ~/.config/xfce4/xfconf/xfce-perchannel-xml/thunar.xml dots/workstation/.config/xfce4/xfconf/xfce-perchannel-xml/thunar.xml
	cp ~/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-desktop.xml dots/workstation/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-desktop.xml
	cp ~/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-notifyd.xml dots/workstation/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-notifyd.xml
	cp ~/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-power-manager.xml dots/workstation/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-power-manager.xml
	cp ~/.config/xfce4/xfconf/xfce-perchannel-xml/xfwm4.xml dots/workstation/.config/xfce4/xfconf/xfce-perchannel-xml/xfwm4.xml
	cp ~/.config/xfce4/xfconf/xfce-perchannel-xml/xsettings.xml dots/workstation/.config/xfce4/xfconf/xfce-perchannel-xml/xsettings.xml
