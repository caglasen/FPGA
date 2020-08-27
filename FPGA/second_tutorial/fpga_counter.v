module fpga_counter(leds, pb0);
input wire pb0;
output reg[7:0] leds;

always @(posedge pb0)
begin
	if(leds == 8'hFF)
		leds <= 8'h00;
	else
		//leds <= (leds<<1) + 1;
		leds <= {leds[6:0], 1'b1};
end

initial
begin
	leds = 8'h00;
end

endmodule
