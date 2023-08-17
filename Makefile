.PHONY: all clean

all: clean dotfiles

clean:
	stow -D home

dotfiles: home
	stow $<
