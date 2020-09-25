//-- counter_tb.v

module counter_tb();

reg CLK = 0;	//-- registro para generar la señal de reloj

wire [7:0] DATA;	//-- datos de salida del contador

reg [7:0] counter_check = 1;	//-- registro para comprobar si el contador cuenta correctamente

//-- Instanciamos el contador
counter C1(
	.clk(CLK),
	.data(DATA)
);

always #1 CLK = ~CLK;	//-- generador de reloj. Periodo 2 unidades

//-- Comprobamos el valor del contador
//-- En cada flanco de bajada se comprueba la salida del contador
//-- y se incrementa el valor esperado
always @(negedge CLK) begin
	if (counter_check != DATA)
		$display("ERROR! Esperando: %d. Leido: %d",counter_check,DATA);
		counter_check <= counter_check + 1;
end

//-- Proceso al inicio
initial begin
	//-- Fichero donde almacenar los resultados
	$dumpfile("counter_tb.vcd");
	$dumpvars(0, counter_tb);

	//-- Comprobacion del reset
	# 0.5 if (DATA != 0)
		$display("ERROR! El contador no esta a 0");
	      else
	        $display("Contador inicializado. OK..");
	# 120 $display("Fin de la simulacion");
	# 121 $finish;
end
endmodule
