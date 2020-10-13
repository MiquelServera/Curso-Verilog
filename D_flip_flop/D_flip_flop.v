//-- Archivo: D_flip_flop (gate model)
//-- Autor: Miquel Servera
//-- Data: 13-10-2020

module dff(
	input wire D, CLK,
	output wire Q, Qbar
);

//-- Sintetizamos una puerta NOT
not g1(_D, D);

//-- Sintetizamos dos puertas AND
and g2(out_g2, _D, CLK);
and g3(out_g3, D, CLK);

//-- Sintetizamos dos puertas NOR
nor g4(Q, out_g2, Qbar);
nor g4(Qbar, out_g3, Q);

endmodule
