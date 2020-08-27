module d_ff
	(
		input wire clk, reset,
		input wire en,
		input wire d,
		output reg q
	);
	
	
	reg [31:0]clk2;
	
	reg r_reg, r_next;
	
	always @(posedge clk)
	begin
		clk2 = clk2 + 1'b1;
	end
	
	always @(posedge clk2[25], posedge reset)
	begin
		if(reset)
			r_reg<=1'b0;
		else
			r_reg<=r_next;
	end
	
	always @*
	begin
		if (en)
			r_next=d;
		else
			r_next=r_reg;
	end
	
	always @*
		q = r_reg;
		
	initial 
	 clk2 = 0;
	
endmodule
