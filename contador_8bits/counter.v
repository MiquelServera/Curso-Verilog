//-- Entrada: señal de reloj (12Mhz)
//-- Salida: contador de 8bits

module counter(input clk, output [7:0] data);

wire clk;

reg [7:0] data = 0;	//-- la salida es un registro de 8bits inicializado a 0

parameter N = 22;	//-- parametro para el prescaler

wire clk_pres;		//-- reloj de salida del prescaler

//-- Instanciamos el prescaler
prescaler #(.N(N))
pres1(
	.clk_in(clk),
	.clk_out(clk_pres)
);

//-- sensible al flanco de subida
always @(posedge clk_pres) begin
	data <= data + 1;	//-- incrementamos el registro
end

endmodule
