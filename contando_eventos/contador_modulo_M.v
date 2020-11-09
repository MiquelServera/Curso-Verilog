//-- Archivo: contador_modulo_M.v
//-- Autor: Miquel Servera
//-- Data: 08-11-2020

`default_nettype none

module contador_modulo_M (input clk, input rst, input cnt, output ov, output [N-1:0] q);

	wire clk;
	wire rst;
	wire cnt;
	wire ov;
	
	//wire [N-1:0] q = 0;	//-- salida del contador inicializado a 0
	
	//-- Numero de bits del contador (por defecto)
	parameter N = 2;
	
	//-- Numero de cuentas (por defecto)
	//parameter M = 4;
	
	//-- En contadores de N bits:
	//-- M = 2 ** N
	
	//-- Internamente usamos un bit mas (N+1) bits
	reg [N:0] qi = 0;
	
	always @(posedge(clk))
		if (rst | ov)
			qi <= 2'b00;
		else if (cnt)
			qi <= qi + 1;
			
	assign q = qi;
	
	//-- comprobamos overflow
	assign ov = (qi == 2 ** N);
	
endmodule
