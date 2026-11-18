`timescale 1ns / 1ps
// control unit
// S1 loads the first number into R0, S2 loads the second into R1,
// S3 lets the multiplier work, S4 writes the product into the RAM, S5 reads it back
module cu (

input clk, reset,
  input [2:0] adr1,
  input [2:0] adr2,
  output reg w_rf,
  output reg [2:0] adr,
  output reg DA,SA,SB,
  output reg [2:0] st_out,
  //output reg done,
  output reg w_ram // only needs 1 bit (was [2:0] in the hint)
);

parameter S0_idle = 0 , S1_send_adr1 = 1 , S2_send_adr2 = 2 ,S3_multiply = 3 ,S4_write_ram = 4,S5_read_ram=5 ;
reg [2:0] PS,NS ;

    always@(posedge clk or posedge reset)
        begin
            if(reset)
                PS <= S0_idle;
            else
                PS <= NS ;
        end

    always@(*)
        begin
            // defaults so nothing turns into a latch
            w_rf = 0;
            w_ram = 0;
            adr = 0;
            DA = 0;
            SA = 0;
            SB = 1;
            st_out = PS;
            NS = S0_idle;

            case(PS)
				S0_idle:begin
				NS = S1_send_adr1;
                w_rf = 0;
                w_ram = 0;
				st_out = 0;
				end

				S1_send_adr1:begin
				w_rf = 1; // load the first number
				adr = adr1;
				DA = 0; // into R0
				SA = 0;
				SB = 1;
				st_out = 1;
				NS = S2_send_adr2;
				end

				S2_send_adr2:begin
				w_rf = 1; // load the second number
				adr = adr2;
				NS = S3_multiply;
				DA = 1; // into R1
				SA = 0;
				SB = 1;
                st_out = 2;
			    end

		        S3_multiply: begin
				NS = S4_write_ram; // A = R0 and B = R1 go into the multiplier
                st_out = 3;
				w_ram = 0;
			    end

                S4_write_ram: begin
                w_ram = 1; // save the product
                st_out = 4;
				NS = S5_read_ram;
				end

				S5_read_ram: begin
                w_ram = 0; // read the RAM so the answer shows on result
                st_out = 5;
				if(!reset) begin
				NS = S5_read_ram; // stay here until reset
				end
				else begin
				NS = S0_idle;
				end
				end
				endcase
				end

endmodule
