`timescale 1ns / 1ps
// testbench for lab 10
// ROM: 0, 12, 6, 7, 8, 1, 13, 14
// pick the addresses, hit reset, and the control unit does the rest
module tb_Lab10();

reg clk, reset;
reg [2:0] addr1_ROM, addr2_ROM, addr_RAM;
wire [7:0] result;

Multiplier_top uut(.clk(clk), .reset(reset), .addr1_ROM(addr1_ROM),
    .addr2_ROM(addr2_ROM), .addr_RAM(addr_RAM), .result(result));

initial clk = 0;
always #5 clk = ~clk;

initial begin
    // 6 x 7 = 42
    addr1_ROM = 2; addr2_ROM = 3; addr_RAM = 0;
    reset = 1; #20; reset = 0; #100;
    $display("6 x 7 = %d (should be 42)", result);

    // 12 x 8 = 96
    addr1_ROM = 1; addr2_ROM = 4; addr_RAM = 1;
    reset = 1; #20; reset = 0; #100;
    $display("12 x 8 = %d (should be 96)", result);

    // 14 x 14 = 196
    addr1_ROM = 7; addr2_ROM = 7; addr_RAM = 2;
    reset = 1; #20; reset = 0; #100;
    $display("14 x 14 = %d (should be 196)", result);

    // 13 x 1 = 13
    addr1_ROM = 6; addr2_ROM = 5; addr_RAM = 3;
    reset = 1; #20; reset = 0; #100;
    $display("13 x 1 = %d (should be 13)", result);

    $finish;
end

endmodule
