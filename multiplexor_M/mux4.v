//-- Fichero mux4.v

module mux4(input wire clk, output reg [3:0] data);

//-- Parametros del secuenciador
parameter NP = 23;		//-- bits del prescaler 
parameter VAL0 = 4'b0000;	//-- valor secuencia 0
parameter VAL1 = 4'b1010;	//-- valor secuencia 1
parameter VAL2 = 4'b1111;	//-- valor secuencia 2
parameter VAL3 = 4'b0101;	//-- valor secuencia 3

//-- Cables para las 5 entradas del multiplexor
wire [3:0] val0;
wire [3:0] val1;
wire [3:0] val2;
wire [3:0] val3;
wire [1:0] sel;		//-- dos bits de seleccion

//-- Por las entradas del mux cableamos los datos de entrada
assign val0 = VAL0;
assign val1 = VAL1;
assign val2 = VAL2;
assign val3 = VAL3;

//-- Contador de 2 bits
reg [1:0] count = 0;
wire clk_pres;		//-- reloj despues del prescaler

always @(posedge (clk_pres)) begin
	count <= count + 1;

end

//-- El contador esta conectado a la entrada sel del mux
assign sel = count;

//-- Implementamos el multiplexor de 4 a 1
always@ (*)
	case (sel)
		0 : data <= val0;
		1 : data <= val1;
		2 : data <= val2;
		3 : data <= val3;
		default : data <= 0;
	endcase

//-- Instanciamos el prescaler
prescaler #(.N(NP))
pres (
	.clk_in(clk),
	.clk_out(clk_pres)
);

endmodule


