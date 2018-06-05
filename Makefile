
all:
	docker build \
	    --network dotfile-net \
	    --tag makohoek-dotfiles .

network:
	docker network create dotfile-net

clean:
	docker network remove dotfile-net
