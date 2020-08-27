module clock_ex(leds, pb1, pb2, clk);

input wire clk;
input wire pb1, pb2;
output reg [7:0]leds;


reg[1:0] state;
reg[25:0] clock2;
wire [1:0] buttons;
assign buttons = {~pb1, ~pb2};

always @(posedge clk)
	begin
		case(state)
			2'b00:
				begin
					case(buttons)
						2'b01:
							begin
								state <= 2'b01;
								leds <= {leds[6:0], 1'b1};
							end
						2'b10:
							begin
								state <= 2'b10;
								leds <= {1'b0, leds[7:1]};
							end
					endcase
				end
			2'b01:
				begin
					if (buttons == 2'b00)
						state <= 2'b00;
				end
			2'b10:
				begin
					if (buttons == 2'b00)
						state <= 2'b00;
				end
		endcase
	end
		
initial
	begin
		leds = 8'b111;
		state = 2'b00;
	end
endmodule
