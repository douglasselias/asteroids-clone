make:
	mkdir -p build && zip -9 -r build/asteroids-clone.love . -x .git\* -x build\* -x .gitignore -x LICENSE -x README.md -x makefile