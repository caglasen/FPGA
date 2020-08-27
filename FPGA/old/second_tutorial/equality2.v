module equality2(a, b, aeqb);

input wire[1:0] a, b;
output wire aeqb;

wire e0, e1;

equality eq1(.i0(a[0]), .i1(b[0]), .eq(e0));
equality eq2(.i0(a[1]), .i1(b[1]), .eq(e1));

assign  aeqb = e0 & e1;

endmodule
