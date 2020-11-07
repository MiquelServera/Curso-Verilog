//-- Archivo: tristate_IceZum.v
//-- Autor: Miquel Servera
//-- Data: 18-10-2020

module tri_state(
	input pin,
 	input oe,
 	input dout,
 	output din
);
	
	//-- modulo triestado
	SB_IO #(
		.PIN_TYPE(6'b1010_01),
		.PULLUP(1'b0)
	) triState (
		.PACKAGE_PIN(pin),
		.OUTPUT_ENABLE(oe),
		.D_OUT_0(dout),
		.D_IN_0(din)
	);
	
endmodule
