module dipswitches(ds, leds, display, grounds, clk);

output reg[3:0] leds;
output reg[6:0] display;
output reg[3:0] grounds;
input [3:0]ds;
input clk;

reg[3:0] data[3:0]; // number to be printled on display
reg[1:0] count;

reg [25:0] clk1;
reg [15:0] number;

reg[3:0] state;

wire[3:0] switch;

assign switch = ds;

always @(posedge clk)
	clk1 <= clk1 + 1;
	
	
always @(posedge clk1[15])
begin
	grounds <= {grounds[2:0], grounds[3]};
	count <= count + 1;
end

always @(*)
	case (data[count])
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

always @(*)
	begin
		data[0] = number[15:12];
		data[1] = number[11:8];
		data[2] = number[7:4];
		data[3] = number[3:0];
		leds=ds;
	end

always @(posedge clk1[20])
	begin
		case (state)
		4'b0000:
			begin
				if(switch == 4'b0001)
					begin
						number <= number + 1;
						state <= 4'b0001;
					end
				else if(switch == 4'b0010)
					begin
						number <= number + 2;
						state <= 4'b0010;
					end
				else if(switch == 4'b0100)
					begin
						number <= number + 4;
						state <= 4'b0100;
					end
				else if(switch == 4'b1000)
					begin
						number <= number + 8;
						state <= 4'b1000;
					end
			end
		4'b0001:
			begin
				if (switch == 4'b00000)
					state <= 4'b0000;
				else
					state <= 4'b0001;
			end
			
		4'b0010:
			begin
				if (switch == 4'b00000)
					state <= 4'b0000;
				else
					state <= 4'b0010;
			end
			
		4'b0100:
			begin
				if (switch == 4'b00000)
					state <= 4'b0000;
				else
					state <= 4'b0100;
			end
			
			
		4'b1000:
			begin
				if (switch == 4'b00000)
					state <= 4'b0000;
				else
					state <= 4'b1000;
			end
		endcase		
	end
	
initial begin
 number = 0;
 state = 4'b0000;
 count = 0;
 grounds = 4'b1110;
 clk1 = 0;
end

endmodule
