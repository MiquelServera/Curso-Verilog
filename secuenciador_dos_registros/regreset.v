//-- Archivo: regreset.v (Secuenciador con dos registros de 4 bits)
//-- Autor: Miquel Servera
//-- Data: 27-10-2020

`default_nettype none

module regreset (input wire clk, output wire [3:0] data);

	//-- Parametros del secuenciador 
	parameter NP = 23;			//-- bits del prescaler
	parameter INI0 = 4'b1010;	//-- valor inicial para el registro 0
	parameter INI1 = 4'b0101;	//-- valor inicial para el registro 1
	
	//-- Reloj de salida del prescaler
	wire clk_pres;
	
	//-- Salida de los registros
	wire [3:0] dout0;
	wire [3:0] dout1;
	
	//-- Señal de inicializacion del reset
	reg rst = 0;
	
	//-- Inicializador
	always @(posedge(clk_pres))
		rst <= 1'b1;
	
	//-- Instanciamos el registro 0
	register #(.INI(INI0))
		registro0(
			.clk(clk_pres),
			.rst(rst),
			.din(dout1),
			.dout(dout0)
		);
		
	//-- Instanciamos el registro 1
	register #(.INI(INI1))
		registro1(
			.clk(clk_pres),
			.rst(rst),
			.din(dout0),
			.dout(dout1)
		);
		
	//-- Sacamos la salida del registro 0 por la salida del componente
	assign data = dout0;
	
	//-- Instanciamos el prescaler
	prescaler #(.N(NP))
		pres(
			.clk_in(clk),
			.clk_out(clk_pres)
		);
		
endmodule 
