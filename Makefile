create:
	@echo "Creating project $(project)..."
	cp -r ./.assets $(project)
	@echo "Created $(project)!"
setdefault:
	mv .assets .assets2
	cp -r $(project) .assets
	rm -r .assets2
matchassets:
	mv $(project)/main.asm $(project)/.main.asm
	cp -r .assets/* $(project)
	mv $(project)/.main.asm main.asm	
updatemake:
	cp .assets/Makefile $(project)
execute:
	@cd $(project) && make execute