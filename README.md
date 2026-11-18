The purpose of this lab was to build a multiplier that reads two numbers from the ROM and writes the answer into the RAM, with a control unit that handles the reading, multiplying and writing stages. We used the code the professor gave us as a starting point and filled it in with our ROM from Lab 9 and our combinational multiplier from Lab 8. The RAM and register file are from her template.

The control unit (cu) goes through 6 states. S1 sends addr1_ROM to the ROM and loads that number into R0, S2 sends addr2_ROM and loads that number into R1, S3 lets the multiplier work on A and B, S4 sets w_ram so the product gets written into the RAM at addr_RAM, and S5 reads the RAM so the answer shows on result. It stays in S5 until reset is pressed.

On the board SW2-SW0 = addr1_ROM, SW5-SW3 = addr2_ROM, SW8-SW6 = addr_RAM, BTNC = reset, and the result shows on LED7-LED0.

tb_Lab10 picks two addresses, presses reset, waits for the control unit to finish, and prints the result. It does 6 x 7, 12 x 8, 14 x 14 and 13 x 1.

Run Instructions, Create a new project, selecting the board type you are uploading to (Basys3) Add the design files under the design folder: Multiplier_top, cu, ROM, RF, comb_mult, RAM Add tb_Lab10 under the simulation folder and set it as top Add Basys3_Lab10.xdc under the constraint folder Set Multiplier_top as the top module Run Synthesis Run Implementation Run Generate Bitstream Find the device and program

Example: SW2-SW0 = 010 and SW5-SW3 = 011, then press BTNC. It multiplies 6 x 7 and LED7-LED0 show 00101010 (42).
