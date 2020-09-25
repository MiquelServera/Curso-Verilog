//-- prescaler.v
//-- clk_in: señal de reloj de entrada
//-- clk_out: señal de reloj de salida

module prescaler(input clk_in, output clk_out);
wire clk_in;
wire clk_out;

parameter N = 22;	//-- numero de bits del prescaler

reg [N-1:0] count = 0;	//-- registro para implementar contador de N bits

assign clk_out = count[N-1];	//-- el bit mas significativo se saca por la salida

//-- Contador: se incrementa en cada flanco de subida
always @(posedge clk_in) begin
	count <= count + 1;
end

endmodule
