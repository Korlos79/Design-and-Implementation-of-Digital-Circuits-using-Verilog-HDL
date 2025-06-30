module Mux2to1_1bit(f, a, b, sel);
input a, b, sel;
output f;
wire f1, f2, nsel;
not g1(nsel, sel);
and g2(f1, a, nsel);
and g3(f2, b, sel);
or g4(f, f1, f2);
endmodule 