# Design-of-dual-port-SRAM-
![Image of SRAM](https://www.intel.com/content/dam/altera-www/global/en_US/images/support/examples/images/true_dpram_sclk_vlog.gif)


Figure 1. True Dual-Port RAM with a Single Clock Top-Level Diagram

## Table 1. True Dual-Port RAM with a Single Clock Port Listing

1. Port-Name-------------------Type-----Description
1. dataa[7:0], datab[7:0]------Input----8 bit data inputs of port A and port B
1. addr_a[5:0],addr_b[5:0]-----Input----6 bit address inputs of port A and port B
1. we_a, we_b------------------Input----Write enable inputs of port A and port B
1. clk-------------------------Input----Clock input
1. q_a[7:0], q_b[7:0]----------Output---8 bit data outputs of port A and port B
