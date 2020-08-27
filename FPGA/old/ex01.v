module ex01 (i0, i1, i2, q1, q2);
input wire i0,i1,i2;
output wire q1,q2;

assign q1 = i0 | i1 |(~i1 & i2);
assign q2 = i2 | (~i0 & ~i1);


endmodule