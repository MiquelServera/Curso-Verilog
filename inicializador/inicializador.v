//-- Fichero inicializador.v
//-- Entrada: cable del reloj
//-- Salida: cable de la señal de inicializacion
module inicializador(input wire clk, output ini);

//-- Registro de 1 bit inicializa a 0 (solo para simulacion)
//-- Al sintetizarlo siempre estara a 0 con independencia
//-- del valor al que lo pongamos

reg ini = 0;

//-- En el flanco de subida sacamos un '1' por la salida
always @(posedge clk) begin
	ini <= 1;
end

endmodule


