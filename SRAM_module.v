`timescale 1ns/1ps

module dual_port_sram (clk , reset, data_A, data_B, rwenable_A, rwenable_B, addr_A, addr_B, outputData_A, outputData_B);

parameter RAM_WIDTH = 8;
parameter RAM_DEPTH = 64;
parameter ADDR_SIZE = 8;

input clk, reset, rwenable_A, rwenable_B;
input [RAM_WIDTH-1:0]data_A, data_B;
input [ADDR_SIZE-1:0]addr_A, addr_B;
output reg[RAM_WIDTH-1:0] outputData_A , outputData_B;

//The RAM variable
reg[RAM_WIDTH-1:0]ram[RAM_DEPTH-1:0];
integer i;

//Define for PORT A
always @ (posedge clk or posedge reset)
	begin
		if(reset)
		begin
			for (i = 0; i<RAM_DEPTH ; i=i+1)
			begin
				ram[i] = 0;
			end
			outputData_A <= 0;
		end

		else
		begin
			if (rwenable_A)
			begin
				ram[addr_A] <= data_A;
				outputData_A <= data_A;
			end
			
			else
			begin
				outputData_A <= ram[addr_A];
			end
		end
	end

//Define for PORT B
always @ (posedge clk or posedge reset)
	begin
		if(reset)
		begin
			for (i = 0; i<RAM_DEPTH ; i=i+1)
			begin
				ram[i] <= 0;
			end
			outputData_B <=0;
		end

		else
		begin
			if (rwenable_B)
			begin
				ram[addr_B] <= data_B;
				outputData_B <= data_B;
			end
			
			else
			begin
				outputData_B <= ram[addr_B];
			end
		end
	end
endmodule	
