module dual_port_sram_TB();

parameter RAM_WIDTH = 8;
parameter RAM_DEPTH = 64;
parameter ADDR_SIZE = 8;

reg clk, reset, rwenable_A, rwenable_B;
reg [RAM_WIDTH-1:0]data_A, data_B;
reg [ADDR_SIZE-1:0]addr_A, addr_B;
wire[RAM_WIDTH-1:0] outputData_A , outputData_B;

integer i;

dual_port_sram DUT (clk , reset, data_A, data_B, rwenable_A, rwenable_B, addr_A, addr_B, outputData_A, outputData_B);

always 
	begin
		#10 clk = ~clk;
	end

task initialize;
	begin
		clk = 0;
		reset = 1;
		rwenable_A = 0;
		rwenable_B = 0;
		data_A = 8'bx;
		data_B = 8'bx;
		addr_A = 8'bx;
		addr_B = 8'bx;
	end
endtask


initial 
	begin
	$dumpfile("SRAMwaveform.vcd");
	$dumpvars(0,dual_port_sram_TB);
	end
initial 
	begin
		initialize;
		$display("Writing to RAM\n");
		for(i = 1; i< 5; i=i+1)
		begin
			@(negedge clk);
			#5
			reset = 0;
			addr_A = i;	rwenable_A = 1;	data_A = 15+i;
			addr_B = i+4;	rwenable_B = 1;	data_B = 19+i;
			$display($time," Writing in addr %d = %d", addr_A, data_A);
			$display($time," Writing in addr %d = %d", addr_B, data_B);
		end
		
		#20 // one clock cycle

		$display("Reading from RAM\n");
		for(i = 1;i<9;i=i+1)
		begin
			@(negedge clk)
			#5
			rwenable_A = 0; rwenable_B = 0;
			addr_A = 9-i;
			$display($time,"The value in Address %d is %d", addr_A, outputData_B);
		end
		
		#10 $finish;

	end

endmodule		
      
		
