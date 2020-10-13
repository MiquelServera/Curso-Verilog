//-- Archivo: SR latch_Enable (gate model)
//-- Autor: Miquel Servera
//-- Data: 04-10-2020

module sr_latch_en(
	input wire R, S, EN,
	output wire Q, Qbar
);

//-- Sintetizamos dos puertas AND
and g1(_R, R, EN);
and g2(_S, S, EN);

//-- Sintetizamos dos puertas NOR
nor g3(Q, _R, Qbar);
nor g4(Qbar, _S, Q);

endmodule	
