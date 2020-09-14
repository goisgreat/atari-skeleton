compile:
	@echo "Compiling...."
	dasm main.asm -f3 -v0 -obin/cart.bin -lbin/cart.lst -sbin/cart.sym
	@echo "Finished. Check above for errors."
execute:
	@echo "Emulating cart.bin...."
	stella bin/cart.bin
	@echo "Program exited."
clean:
	@echo "Removing * from ./bin."
	rm bin/*
.SILENT:
run: compile execute
