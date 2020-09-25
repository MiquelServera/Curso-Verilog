//-- Fichero mux2.v

module mux2(input wire clk, output reg [3:0] data);

//-- Parametros del secuenciador
parameter NP = 24;		//-- bits del prescaler
parameter VAL0 = 4'b1010;	//-- valor secuencia 0
parameter VAL1 = 4'b0101;	//-- valor secuencia 1

//-- Cables de las 3 entradas del multiplexor
wire [3:0] val0;
wire [3:0] val1;
wire sel;

//-- Por las entradas del mux cableamos los datos de entrada
assign val0 = VAL0;
assign val1 = VAL1;

//-- Implementamos el multiplexor
always @(*) begin
	if(sel == 0)
		data <= val0;
	else
		data <= val1;
end

//-- Instanciamos el prescaler
prescaler #(.N(NP))
pres (
	.clk_in(clk),
	.clk_out(sel)
);

endmodule
