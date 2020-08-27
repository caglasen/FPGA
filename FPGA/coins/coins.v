module coins(leds, pb0, pb1, clk);
input pb0, pb1;
input clk;
output reg[7:0] leds;

reg[7:0] total;
wire[2:0] buttons;
reg[1:0] states;
assign buttons = {~pb1, ~pb0};

localparam  STATE00 = 2'b00,
				STATE01 = 2'b01,
				STATE10 = 2'b10;
				
				
always @(posedge clk)
begin
	case (states)
		STATE00:begin
			if (buttons == 2'b01)
			begin
				states <= STATE01;
				total <= total + 5;
			end
			else if (buttons == 2'b10)
			begin
				states <= STATE10;
				total <= total + 10;
			end
			
			if (total >= 20)
			begin
				total <= total - 20;
				leds <= leds + 1;
			end
		end
		STATE01:begin
			if (buttons == 2'b00)
				states <= STATE00;
			else
				states <= STATE01;
		end
		STATE10:begin
			if (buttons == 2'b00)
				states <= STATE00;
			else
				states <= STATE10;
		end
	endcase
end

initial
begin
	leds = 8'b0;
	states = STATE00;
	total = 0;
end

endmodule
