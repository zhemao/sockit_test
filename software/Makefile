KERNEL_SRC_DIR=/home/zhehao/programs/others/linux-socfpga
PWD=$(shell pwd)

all: blinker_us blinker

blinker:
	make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- -C $(KERNEL_SRC_DIR) \
		M=$(PWD)/blinker modules

blinker_us:
	make -C blinker_us

clean:
	make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- -C $(KERNEL_SRC_DIR) \
		M=$(PWD)/blinker clean
	make -C blinker_us clean

install: all
	cp hps_scripts/program_fpga.sh /mnt/root
	cp blinker_us/blinker /mnt/root
	cp blinker/blinker.ko /mnt/root

.PHONY: blinker blinker_us clean install
