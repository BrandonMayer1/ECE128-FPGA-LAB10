## Lab 10 - Multiplier using ROM and RAM (Basys 3)

## 100 MHz clock
set_property PACKAGE_PIN W5 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]

## reset = btnC
set_property PACKAGE_PIN U18 [get_ports reset]
set_property IOSTANDARD LVCMOS33 [get_ports reset]

## addr1_ROM = SW2-SW0
set_property PACKAGE_PIN V17 [get_ports {addr1_ROM[0]}]
set_property PACKAGE_PIN V16 [get_ports {addr1_ROM[1]}]
set_property PACKAGE_PIN W16 [get_ports {addr1_ROM[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {addr1_ROM[*]}]

## addr2_ROM = SW5-SW3
set_property PACKAGE_PIN W17 [get_ports {addr2_ROM[0]}]
set_property PACKAGE_PIN W15 [get_ports {addr2_ROM[1]}]
set_property PACKAGE_PIN V15 [get_ports {addr2_ROM[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {addr2_ROM[*]}]

## addr_RAM = SW8-SW6
set_property PACKAGE_PIN W14 [get_ports {addr_RAM[0]}]
set_property PACKAGE_PIN W13 [get_ports {addr_RAM[1]}]
set_property PACKAGE_PIN V2 [get_ports {addr_RAM[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {addr_RAM[*]}]

## result = LED7-LED0
set_property PACKAGE_PIN U16 [get_ports {result[0]}]
set_property PACKAGE_PIN E19 [get_ports {result[1]}]
set_property PACKAGE_PIN U19 [get_ports {result[2]}]
set_property PACKAGE_PIN V19 [get_ports {result[3]}]
set_property PACKAGE_PIN W18 [get_ports {result[4]}]
set_property PACKAGE_PIN U15 [get_ports {result[5]}]
set_property PACKAGE_PIN U14 [get_ports {result[6]}]
set_property PACKAGE_PIN V14 [get_ports {result[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {result[*]}]
