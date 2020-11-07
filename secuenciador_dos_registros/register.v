//-- Archivo: register.v
//-- Autor: Miquel Servera
//-- Data: 27-10-2020

`default_nettype none

module register (clk, rst, din, dout);

	//-- Parametros:
	parameter N = 4;	//-- numero de bits del registro
	parameter INI = 0;  //-- valor inicial
	
	//-- Declaracion de puertos
	input wire clk;
	input wire rst;
	input wire [N-1:0] din;
	output reg [N-1:0] dout;
	
	//-- registro
	always @(posedge(clk))
		if (rst == 0)
			dout <= INI;	//-- inicializacion
		else
			dout <= din;	//-- funcionamiento normal
			
endmodule
