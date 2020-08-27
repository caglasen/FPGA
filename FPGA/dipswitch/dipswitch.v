module dipswitch(
						input [3:0] ds,
						input clk,
						output reg[7:0] leds
						);

//wire ds0;
//assign ds0 = ds[0];
reg ds0;
reg state;
reg[7:0] check;

// Solve bouncing problem
always @ (posedge clk)
begin
	check <= {check[6:0], ds[0]};
	if (check == 25'b1111111)
		ds0<=1;,,,,,,,,,,,,,,,,,,,,,,,,,
	else
		ds0<=0;
end 

always @(posedge clk)
begin
	case (state)
		1'b0:
			begin
				if (ds[0] == 1)
					begin
						state <= 1;
						leds <= {leds[6:0], leds[7]};
					end
			end
		1'b1:
			begin
				if (ds[0] == 0)
					begin
						state <= 0;
					end
			end
	endcase
end

initial begin
	state = 0;
	leds = 8'b1;
end

endmodule
