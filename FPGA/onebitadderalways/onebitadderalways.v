module onebitadderalways(sw1, sw2, leds);
input wire sw1, sw2;
output reg [1:0] leds;

always @(*)
begin
	leds[0] = sw1 ^ sw2;
	if ((sw1 == 1) && (sw2 == 1))
		leds[1] = 1;
	else
		leds[1] = 0;
end

endmodule