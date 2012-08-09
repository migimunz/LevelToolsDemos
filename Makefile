all: neko

neko:
	$(MAKE) -C IterateTilemap/ neko
	$(MAKE) -C LoadTilemap/ neko

flash:
	$(MAKE) -C IterateTilemap/ flash
	$(MAKE) -C LoadTilemap/ flash

clean:
	$(MAKE) -C IterateTilemap/ clean
	$(MAKE) -C LoadTilemap/ clean
