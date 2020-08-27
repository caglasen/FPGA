module clock_ex(leds, pb1, pb2, clk);
input clk;
input pb1, pb2;
output reg[7:0] leds;
reg[25:0] clock2;
reg[1:0] states;
wire[1:0] buttons;

localparam 	STATE0 = 2'b00,
				STATE1 = 2'b01,
				STATE2 = 2'b10;

/* clock frequency is very high, so all leds will light up. 
always @(posedge clk)
begin
	leds <= {leds[6:0],leds[7]};
end

initial
begin
	leds = 8'b00000001;
end
*/

/* This code uses to slow clock frequency
always @(posedge clk)
	clock2 <= clock2 + 1;

always @(posedge clock2[24])
begin
	leds <= {leds[6:0],leds[7]};
end

initial
begin
	leds = 8'b00000001;
end
*/

/*
always @(posedge clk)
	clock2 <= clock2 + 1;

always @(posedge clock2[24])
begin
	
	if ((pb1 == 1'b0) && (pb2 == 1'b1))
	begin
		leds[7] <= 1;
	end
	else if ((pb1 == 1'b1) && (pb2 == 1'b0))
	begin
		leds[0]<=1;
	end
	else
	begin
		leds<=8'b0;
	end
end
initial
begin
	leds = 8'b00000001;
end

*/
/*
always @(posedge clk)
	clock2 <= clock2 + 1;

always @(posedge clock2[24])
begin
	if(~pb1)
		leds <= (leds << 1) + 1;
	else if (~pb2)
		leds <= (leds >> 1);
end
*/

assign buttons = {~pb1, ~pb2};

always @(posedge clk)
begin
	case(states)
		STATE0: 
		begin
			case(buttons)
					2'b01: 
					begin
						states <= STATE1;
						leds <= {leds[6:0], 1'b1};
					end
					2'b10:
					begin
						states <= STATE2;
						leds <= {1'b0, leds[7:1]};
					end
					default:
					begin
						states <= STATE0;
					end
			endcase
		end
		STATE1:
		begin
			if (buttons == 2'b00)
				states <= STATE0;
			else
				states <= STATE1;
		end
		STATE2:
		begin
			if (buttons == 2'b00)
				states <= STATE0;
			else
				states <= STATE2;
		end
	endcase
end

initial
begin
	states = 2'b00;
end

endmodule
