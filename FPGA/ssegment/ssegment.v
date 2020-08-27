module ssegment (keys, leds, grounds, display, clk);
output reg[6:0] display;
output reg[3:0] grounds;
output reg[7:0] leds;
input [1:0] keys;
input clk;

wire[1:0] buttons;
assign buttons = {~keys[1], ~keys[0]};
reg[1:0] state;

reg [3:0] data;

always @(posedge clk)
begin
	case (state)
		2'b00:
			begin
				case(buttons)
					2'b01: 
						begin
							state <= 2'b01;
							grounds <= { grounds[2:0], grounds[3]};
							leds <= {leds[6:0], leds[7]};
						end
					2'b10:
						begin
							state <= 2'b10;
							grounds <= {grounds[0], grounds[3:1]};
							leds <= {leds[0], leds[7:1]};
						end
				endcase
			end
		
		2'b01:
			begin
				if (buttons == 2'b00)
					state <= 2'b00;
				else
					state <=2'b01;
			end
		2'b10:
			begin
				if (buttons == 2'b00)
					state <= 2'b00;
				else
					state <= 2'b10;
			end
	endcase
end

always @*
	case (data)
		0: display = 7'b1111110;
		1: display = 7'b0110000;
		2: display = 7'b1101101;
		3: display = 7'b1111001;
		4: display = 7'b0110011;
		5: display = 7'b1011011;
		6: display = 7'b1011111;
		7: display = 7'b1110000;
		8: display = 7'b1111111;
		9: display = 7'b1111011;
		'ha: display = 7'b1110111;
		'hb: display = 7'b0011111;
		'hc: display = 7'b1001110;
		'hd: display = 7'b0111101;
		'he: display = 7'b1001111;
		'hf: display = 7'b1000111;
	endcase

initial begin
	data = 'h8;
	state = 2'b00;
	grounds = 4'b1110;
	leds = 8'b1;
end
endmodule
