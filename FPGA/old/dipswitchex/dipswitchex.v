module dipswitchex (
	input [3:0] ds,
	output [3:0] leds
);

assign leds = ds;
endmodule
