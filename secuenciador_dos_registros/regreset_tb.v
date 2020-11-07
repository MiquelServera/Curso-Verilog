module regreset_tb();

	//-- Registro para generar la señal de reloj
	reg clk = 0;
	
	//-- Datos de salida del componente
	wire [3:0] data;
	
	//-- Instanciamos el componente, con prescaler de 1 bit (para la simulacion)
	regreset #(.NP(1))
	dut (
		.clk(clk),
		.data(data)
		);
		
	//-- Generador de reloj. Periodo 2 unidades
	always #1 clk = ~clk;
	
	//-- Proceso al inicio
	initial begin
	
		//-- Fichero donde almacenar los resultados
		$dumpfile("regreset_tb.vcd");
		$dumpvars(0, regreset_tb);
		
		#40 $display("Fin de la simulacion");
		$finish;
	end
	
endmodule
