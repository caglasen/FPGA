module mux_4_to_1(out, in0, in1, in2, in3, sel0, sel1);
output out;
input in0, in1, in2, in3, sel0, sel1;

wire notSel0, notSel1;
wire y0, y1, y2, y3;

not(notSel0, sel0);
not(notSel1, sel1);
and(y0, in0, notSel1, notSel0);
and(y1, in1, notSel1, sel0);
and(y2, in2, sel1, notSel0);
and(y3, in3, sel1, sel0);
or(out, y0, y1, y2, y3);

endmodule

