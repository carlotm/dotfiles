packages = alacritty bash fonts git gtk scripts starship vim x

.PHONY: all clean link

all: clean link

clean:
	stow -D $(packages)

link: $(packages)
	stow $(packages)
