//-- Archivo: D_latch (gate model)
//-- Autor: Miquel Servera
//-- Data: 12-10-2020

module d_latch(
	input wire D, EN,
	output wire Q, Qbar
);

//-- Sintetizamos una puerta NOT
not g1(_D, D);

//-- Sintetizamos dos puertas AND
and g2(out_g2, _D, EN);
and g3(out_g3, D, EN);

//-- Sintetizamos dos puertas NOR
nor g4(Q, out_g2, Qbar);
nor g4(Qbar, out_g3, Q);

endmodule
