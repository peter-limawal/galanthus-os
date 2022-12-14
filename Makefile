GPPPARAMS = -m32 -fno-use-cxa-atexit -nostdlib -fno-builtin -fno-rtti -fno-exceptions -fno-leading-underscore
ASPARAMS = --32
LDPARAMS = -melf_i386

OBJECTS = loader.o kernel.o

%.o: %.cpp
	g++ ${GPPPARAMS} -o $@ -c $<

%.o: %.s
	as ${ASPARAMS} -o $@ $<

gkernel.bin: linker.ld ${OBJECTS}
	ld ${LDPARAMS} -T $< -o $@ ${OBJECTS}

install: gkernel.bin
	sudo cp $< /boot/gkernel.bin
