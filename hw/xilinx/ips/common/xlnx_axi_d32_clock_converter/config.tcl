# Author: Manuel Maddaluno <manuel.maddaluno@unina.it>
# Description: AXI Clock Converter - Needed to do clock-domain crossing

create_ip -name axi_clock_converter -vendor xilinx.com -library ip -version 2.1 -module_name $::env(IP_NAME)

set_property -dict [list \
    CONFIG.ACLK_ASYNC {1} \
    CONFIG.SYNCHRONIZATION_STAGES {4} \
] [get_ips $::env(IP_NAME)]

# Fixed to 32 bits
set_property CONFIG.DATA_WIDTH  32                      [get_ips $::env(IP_NAME)]
set_property CONFIG.ADDR_WIDTH  32                      [get_ips $::env(IP_NAME)]
set_property CONFIG.ID_WIDTH    $::env(MBUS_ID_WIDTH)   [get_ips $::env(IP_NAME)]