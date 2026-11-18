`timescale 1ns / 1ps
// Lab 10 - multiplier using ROM and RAM
// reads two numbers from the ROM, multiplies them, writes the answer in the RAM
module Multiplier_top(input clk, reset,
                input [2:0] addr1_ROM, addr2_ROM, addr_RAM,
                output [7:0] result);

    wire w_rf, w_ram;
    wire [2:0] adr;
    wire DA, SA, SB;
    wire [2:0] st_out;
    wire [3:0] rom_data;
    wire [3:0] A, B;
    wire [7:0] product;

    cu uut0(.clk(clk), .reset(reset), .adr1(addr1_ROM), .adr2(addr2_ROM),
        .w_rf(w_rf), .adr(adr), .DA(DA), .SA(SA), .SB(SB),
        .st_out(st_out), .w_ram(w_ram));

    ROM uut1(.ROM_data(rom_data), .ROM_addr(adr));

    RF uut2(.A(A), .B(B), .SA(SA), .SB(SB), .D(rom_data), .DA(DA),
        .W(w_rf), .rst(reset), .clk(clk));

    comb_mult uut3(.a(A), .b(B), .product(product));

    RAM uut4(.i_clk(clk), .i_rst(reset), .i_addr(addr_RAM), .i_write_data(product),
        .i_write_en(w_ram), .o_read_data(result));
endmodule
