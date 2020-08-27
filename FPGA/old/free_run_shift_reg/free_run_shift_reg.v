module free_run_shift_reg (clk, reset, s_out);
input wire clk, reset;
output wire [7:0] s_out;

reg [24:0] clock2;

reg [7:0] r_reg;
wire [7:0] r_next;


always @(posedge clk)
	clock2 = clock2 + 1;
	
always @(posedge clock2[24])
begin
		r_reg <= r_next;
end
assign r_next = {r_reg[0], r_reg[7:1]};
assign s_out = r_next;

initial
begin
	r_reg = 8'b10101010;
	clock2 = 8'b0;
end
endmodule
