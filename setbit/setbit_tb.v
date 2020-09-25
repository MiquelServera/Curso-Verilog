//-- Fichero setbit_tb.v
//-- Modulo para el testbench

module setbit_tb();

wire A;		//-- Cable para conectar al pin de salida de setbit

//-- Instanciamos el componente
setbit SB1 (
	.salida (A)
);

//-- Comenzamos las pruebas (bloque de comprobacion)
initial begin
	$dumpfile("setbit_tb.vcd");	//-- Definimos el fichero donde volcar los datos
	$dumpvars(0, setbit_tb);	//-- Volcamos todos los datos a ese fichero (al finalizar la simulacion)

	//-- Pasadas 10 unidades de tiempo comprobamos si el cable eata a '1'
	//-- en caso de no estar a '1', se informa del problema, pero la 
	//-- simulacion no se detiene
	# 10 if (A != 1)
		$display("¡ERROR..! La salida no esta a 1");
	     else
		$display("Componente OK!");
	
	//-- Terminar la simulacion tras 10 unidades de tiempo desde la
	//comprobacion
	# 10 $finish;
end
endmodule
