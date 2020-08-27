module onebitadder(sw1, sw2, leds);
	input wire sw1, sw2;
	output [1:0] leds;
	
	assign leds[0] = sw1^sw2;
	assign leds[1] = (sw1 & sw2) ? 1 : 0;
	
endmodule
