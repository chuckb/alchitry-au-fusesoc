# Io Seven Segment LED - active low
set_property -dict {PACKAGE_PIN T5 IOSTANDARD LVCMOS33} [get_ports {io_ss_led[0]}]
set_property -dict {PACKAGE_PIN R5 IOSTANDARD LVCMOS33} [get_ports {io_ss_led[1]}]
set_property -dict {PACKAGE_PIN T9 IOSTANDARD LVCMOS33} [get_ports {io_ss_led[2]}]
set_property -dict {PACKAGE_PIN R6 IOSTANDARD LVCMOS33} [get_ports {io_ss_led[3]}]
set_property -dict {PACKAGE_PIN R7 IOSTANDARD LVCMOS33} [get_ports {io_ss_led[4]}]
set_property -dict {PACKAGE_PIN T7 IOSTANDARD LVCMOS33} [get_ports {io_ss_led[5]}]
set_property -dict {PACKAGE_PIN T8 IOSTANDARD LVCMOS33} [get_ports {io_ss_led[6]}]
set_property -dict {PACKAGE_PIN T10 IOSTANDARD LVCMOS33} [get_ports {io_ss_led[7]}]

# Io Seven Segment enable pins - active low
set_property -dict {PACKAGE_PIN P9 IOSTANDARD LVCMOS33} [get_ports {io_ss_en[0]}]
set_property -dict {PACKAGE_PIN N9 IOSTANDARD LVCMOS33} [get_ports {io_ss_en[1]}]
set_property -dict {PACKAGE_PIN R8 IOSTANDARD LVCMOS33} [get_ports {io_ss_en[2]}]
set_property -dict {PACKAGE_PIN P8 IOSTANDARD LVCMOS33} [get_ports {io_ss_en[3]}]

# Io DIP Switches
# Right bank
set_property -dict {PACKAGE_PIN C4 IOSTANDARD LVCMOS33 PULLDOWN TRUE} [get_ports {io_dip_sw[7]}]
set_property -dict {PACKAGE_PIN D4 IOSTANDARD LVCMOS33 PULLDOWN TRUE} [get_ports {io_dip_sw[6]}]
set_property -dict {PACKAGE_PIN G4 IOSTANDARD LVCMOS33 PULLDOWN TRUE} [get_ports {io_dip_sw[5]}]
set_property -dict {PACKAGE_PIN G5 IOSTANDARD LVCMOS33 PULLDOWN TRUE} [get_ports {io_dip_sw[4]}]
set_property -dict {PACKAGE_PIN E5 IOSTANDARD LVCMOS33 PULLDOWN TRUE} [get_ports {io_dip_sw[3]}]
set_property -dict {PACKAGE_PIN F5 IOSTANDARD LVCMOS33 PULLDOWN TRUE} [get_ports {io_dip_sw[2]}]
set_property -dict {PACKAGE_PIN D5 IOSTANDARD LVCMOS33 PULLDOWN TRUE} [get_ports {io_dip_sw[1]}]
set_property -dict {PACKAGE_PIN D6 IOSTANDARD LVCMOS33 PULLDOWN TRUE} [get_ports {io_dip_sw[0]}]

# Center bank
set_property -dict {PACKAGE_PIN N6 IOSTANDARD LVCMOS33 PULLDOWN TRUE} [get_ports {io_dip_sw[15]}]
set_property -dict {PACKAGE_PIN M6 IOSTANDARD LVCMOS33 PULLDOWN TRUE} [get_ports {io_dip_sw[14]}]
set_property -dict {PACKAGE_PIN B1 IOSTANDARD LVCMOS33 PULLDOWN TRUE} [get_ports {io_dip_sw[13]}]
set_property -dict {PACKAGE_PIN C1 IOSTANDARD LVCMOS33 PULLDOWN TRUE} [get_ports {io_dip_sw[12]}]
set_property -dict {PACKAGE_PIN C2 IOSTANDARD LVCMOS33 PULLDOWN TRUE} [get_ports {io_dip_sw[11]}]
set_property -dict {PACKAGE_PIN C3 IOSTANDARD LVCMOS33 PULLDOWN TRUE} [get_ports {io_dip_sw[10]}]
set_property -dict {PACKAGE_PIN D3 IOSTANDARD LVCMOS33 PULLDOWN TRUE} [get_ports {io_dip_sw[9]}]
set_property -dict {PACKAGE_PIN E3 IOSTANDARD LVCMOS33 PULLDOWN TRUE} [get_ports {io_dip_sw[8]}]

# Left bank
set_property -dict {PACKAGE_PIN K2 IOSTANDARD LVCMOS33 PULLDOWN TRUE} [get_ports {io_dip_sw[23]}]
set_property -dict {PACKAGE_PIN K3 IOSTANDARD LVCMOS33 PULLDOWN TRUE} [get_ports {io_dip_sw[22]}]
set_property -dict {PACKAGE_PIN J4 IOSTANDARD LVCMOS33 PULLDOWN TRUE} [get_ports {io_dip_sw[21]}]
set_property -dict {PACKAGE_PIN J5 IOSTANDARD LVCMOS33 PULLDOWN TRUE} [get_ports {io_dip_sw[20]}]
set_property -dict {PACKAGE_PIN H3 IOSTANDARD LVCMOS33 PULLDOWN TRUE} [get_ports {io_dip_sw[19]}]
set_property -dict {PACKAGE_PIN J3 IOSTANDARD LVCMOS33 PULLDOWN TRUE} [get_ports {io_dip_sw[18]}]
set_property -dict {PACKAGE_PIN H4 IOSTANDARD LVCMOS33 PULLDOWN TRUE} [get_ports {io_dip_sw[17]}]
set_property -dict {PACKAGE_PIN H5 IOSTANDARD LVCMOS33 PULLDOWN TRUE} [get_ports {io_dip_sw[16]}]

# Io LEDs
# Right bank
set_property -dict {PACKAGE_PIN B6 IOSTANDARD LVCMOS33} [get_ports {io_led[0]}]
set_property -dict {PACKAGE_PIN B5 IOSTANDARD LVCMOS33} [get_ports {io_led[1]}]
set_property -dict {PACKAGE_PIN A5 IOSTANDARD LVCMOS33} [get_ports {io_led[2]}]
set_property -dict {PACKAGE_PIN A4 IOSTANDARD LVCMOS33} [get_ports {io_led[3]}]
set_property -dict {PACKAGE_PIN B4 IOSTANDARD LVCMOS33} [get_ports {io_led[4]}]
set_property -dict {PACKAGE_PIN A3 IOSTANDARD LVCMOS33} [get_ports {io_led[5]}]
set_property -dict {PACKAGE_PIN F4 IOSTANDARD LVCMOS33} [get_ports {io_led[6]}]
set_property -dict {PACKAGE_PIN F3 IOSTANDARD LVCMOS33} [get_ports {io_led[7]}]

# Center bank
set_property -dict {PACKAGE_PIN F2 IOSTANDARD LVCMOS33} [get_ports {io_led[8]}]
set_property -dict {PACKAGE_PIN E1 IOSTANDARD LVCMOS33} [get_ports {io_led[9]}]
set_property -dict {PACKAGE_PIN B2 IOSTANDARD LVCMOS33} [get_ports {io_led[10]}]
set_property -dict {PACKAGE_PIN A2 IOSTANDARD LVCMOS33} [get_ports {io_led[11]}]
set_property -dict {PACKAGE_PIN E2 IOSTANDARD LVCMOS33} [get_ports {io_led[12]}]
set_property -dict {PACKAGE_PIN D1 IOSTANDARD LVCMOS33} [get_ports {io_led[13]}]
set_property -dict {PACKAGE_PIN E6 IOSTANDARD LVCMOS33} [get_ports {io_led[14]}]
set_property -dict {PACKAGE_PIN K5 IOSTANDARD LVCMOS33} [get_ports {io_led[15]}]

# Left bank
set_property -dict {PACKAGE_PIN G2 IOSTANDARD LVCMOS33} [get_ports {io_led[16]}]
set_property -dict {PACKAGE_PIN G1 IOSTANDARD LVCMOS33} [get_ports {io_led[17]}]
set_property -dict {PACKAGE_PIN H2 IOSTANDARD LVCMOS33} [get_ports {io_led[18]}]
set_property -dict {PACKAGE_PIN H1 IOSTANDARD LVCMOS33} [get_ports {io_led[19]}]
set_property -dict {PACKAGE_PIN K1 IOSTANDARD LVCMOS33} [get_ports {io_led[20]}]
set_property -dict {PACKAGE_PIN J1 IOSTANDARD LVCMOS33} [get_ports {io_led[21]}]
set_property -dict {PACKAGE_PIN L3 IOSTANDARD LVCMOS33} [get_ports {io_led[22]}]
set_property -dict {PACKAGE_PIN L2 IOSTANDARD LVCMOS33} [get_ports {io_led[23]}]

# Io Push Button Switches
set_property -dict {PACKAGE_PIN C6 IOSTANDARD LVCMOS33 PULLDOWN TRUE} [get_ports {io_sw[0]}]
set_property -dict {PACKAGE_PIN C7 IOSTANDARD LVCMOS33 PULLDOWN TRUE} [get_ports {io_sw[1]}]
set_property -dict {PACKAGE_PIN A7 IOSTANDARD LVCMOS33 PULLDOWN TRUE} [get_ports {io_sw[2]}]
set_property -dict {PACKAGE_PIN B7 IOSTANDARD LVCMOS33 PULLDOWN TRUE} [get_ports {io_sw[3]}]
set_property -dict {PACKAGE_PIN P11 IOSTANDARD LVCMOS33 PULLDOWN TRUE} [get_ports {io_sw[4]}]
