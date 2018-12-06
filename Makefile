game.love: $(wildcard src/*)
	cd src && zip -9 -r ../game.love *

.PHONY: clean test
clean:
	rm game.love
test: game.love
	@love game.love
