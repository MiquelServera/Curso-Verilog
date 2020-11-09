//-- Archivo: contando_eventos.v
//-- Autor: Miquel Servera
//-- Data: 08-11-2020

`default_nettype none

module contando_eventos (input wire clk, input wire cnt, input wire ff_rst, input wire cnt_rst, output wire ov, output wire [N-1:0] data);

	//-- cable intermedio entre pulsador_tic y contador modulo_M
	wire tic_out;
	
	//-- cable intermedio entre el contador modulo_M y el biestable_SR
	wire overflow;
	
	//-- parametro para el contador modulo_M
	parameter N = 3;

	//-- Instanciamos el pulsador_tic
	pulsador_tic 
	pulsador1 (
				.clk(clk),
				.d(cnt),
				.tic(tic_out)
			  );
			  
	//-- Instanciamos el biestable_SR_sincrono
	biestable_SR
	SR1 (
		.clk(clk),
		.set(overflow),
		.rst(ff_rst),
		.q(ov)
		);
		
	//-- Instanciamos el contador modulo_M
	contador_modulo_M #(.N(N))
	contM1 (
			.clk(clk),
			.rst(cnt_rst),
			.cnt(tic_out),
			.ov(overflow),
			.q(data)
			);		  
endmodule
