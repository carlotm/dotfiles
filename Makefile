.PHONY: all clean

all: clean dotfiles conf

clean:
	stow -D home
	stow -D etc

dotfiles: home
	stow $<

conf: etc
	sudo stow -t /etc $<
