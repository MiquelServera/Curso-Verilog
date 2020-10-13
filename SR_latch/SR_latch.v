//-- Archivo: SR latch (gate model)
//-- Autor: Miquel Servera
//-- Data: 03-10-2020

module sr_latch(
	input wire S, R,
	output wire Q, Qbar
);

//-- Sintetizamos dos puertas NOR
nor g1(Q, R, Qbar);
nor g2(Qbar, S, Q);

endmodule
