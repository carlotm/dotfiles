packages = $(notdir $(realpath $(dir $(wildcard ./*/))))

.PHONY: all clean link

all: clean link

clean:
	stow -D $(packages)

link: $(packages)
	stow $(packages)
