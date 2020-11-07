//-- Archivo: IO_control (uso del tri-state)
//-- Autor: Miquel Servera
//-- Data: 21-10-2020

`default_nettype none

module IO_control(entrada, oe, dout, led);
	
	inout wire entrada;
	input wire oe;
	input wire dout;
	output wire led;

	//-- Instanciamos modulo tri_state
	tri_state
	tri_state1(
		.pin(entrada),
		.oe(oe),
		.dout(dout),
		.din(led)
		);
endmodule
