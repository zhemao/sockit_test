#include <linux/init.h>
#include <linux/module.h>
#include <linux/kernel.h>

volatile char *blinker_mem;

MODULE_LICENSE("Dual BSD/GPL");

static int blinker_init(void)
{
	unsigned long blink_base = (1 << 32);

	pr_info("Loaded blinker module.\n");

	blinker_mem = phys_to_virt(blink_base);

	pr_info("Current blinker delay is %d\n", *blinker_mem);

	*blinker_mem = 0x2;

	return 0;
}

static void blinker_exit(void)
{
	*blinker_mem = 0x4;
	pr_info("Unloaded blinker module.\n");
}

module_init(blinker_init);
module_exit(blinker_exit);
