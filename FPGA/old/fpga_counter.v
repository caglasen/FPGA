module fpga_counter(leds, pb1);
output reg[7:0] leds;
input pb1;

always @(posedge pb1)
begin
	if(leds == 8'hFF)
		leds <= 8'h00;
	else
		leds <= (leds<<1) + 1;
		
end

initial begin
leds = 8'h00;
end

endmodule