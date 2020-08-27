module coins(key0, key1, leds, clk);

input key0, key1, clk;
output reg [7:0] leds;

reg [7:0] total;

wire [1:0] buttons;

assign buttons = {~key1, ~key0};
reg [1:0] bstate;

always @(posedge clk)
begin
	case(bstate)
		2'b00:
		begin
			if (buttons == 2'b01)
			begin
				bstate <= 2'b01;
				total <= total + 5;
			end
			else if(buttons == 2'b10)
			begin
				bstate <= 2'b10;
				total <= total + 10;
			end
			if (total >= 20)
			begin
				leds <= leds + 1;
				total <= total - 20;
			end
		end
		2'b01:
		begin
			if (buttons == 2'b00)
				bstate <= 2'b00;
		end
		2'b10:
		begin
			if (buttons == 2'b00)
				bstate <= 2'b00;
		end
	endcase
end

initial
begin
	leds = 8'b0;
	bstate = 2'b00;
	total = 0;
end

endmodule
