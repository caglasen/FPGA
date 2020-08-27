module aluop(switch, leds);
input [3:0] switch;
output reg[7:0] leds;

reg[0:7] w1, w2;

always @*
begin
	w1 = 8'h22;
	w2 = 8'h11;
	
	case(switch)
		4'b0000: leds = w1 + w2; // 0 addition
		4'b0001: leds = w1 - w2; // 1 subtraction
		4'b0010: leds = w1 & w2; // 2 bitwise and
		4'b0011: leds = w1 | w2; // 3 bitwise or
		4'b0100: leds = w1 ^ w2; // 4 bitwise xor
		4'b0101: leds = ~w1;		 // 5 not
		4'b0110: leds = w1;		 // 6 move
		4'b0111: leds = w1 + 1;  // 7 increment
		4'b1000: leds = w1 -1;   // 8 decrement
		default: leds = 0;
	endcase
end
endmodule