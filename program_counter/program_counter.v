//-- Archivo: program_counter (8-bit_computer)
//-- Autor: Miquel Servera
//-- Data: 13-10-2020

module pc_4bits(LDbar, CLRbar, P, T, CLK, D, count, RCO, Q);
	
	//-- Parametros:
	parameter N = 22;	//-- Numero de bits del prescaler
	parameter INI = 0;	//-- Valor inicial
	
	//-- Declaracion de puertos
	input wire LDbar, CLRbar, P, T, CLK;
	input wire [3:0] D;
	output wire [3:0] count;
	output wire RCO;
	output reg [3:0] Q;
	
	//-- Reloj de salida del prescaler
	wire clk_pres;
	
	//-- Instanciamos el prescaler
	prescaler #(.N(N))
	pres(
			.clk_in(CLK),
			.clk_out(clk_pres)
		);
		
	//-- Modelamos el Contador
	always @(posedge(clk_pres)) begin
		if (!CLRbar)
			Q <= INI;
		else if (!LDbar)
			Q <= D;
		else if (P && T)
			Q <= Q + 1;
	end
	
	assign count = Q;
	assign RCO = Q[3] & Q[2] & Q[1] & Q[0] & T;
	
endmodule 
	 
