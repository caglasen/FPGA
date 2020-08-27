// a single clock as an input and 32 bits as an output
module simple_counter(CLOCK_5, counter_out);

input wire CLOCK_5;
output [31:0] counter_out;
reg [31:0] counter_out;

always @(posedge CLOCK_5)
	begin
		counter_out <= counter_out + 1 ;
	end

endmodule
