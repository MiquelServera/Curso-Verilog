//-- Archivo: pulsador_tic.v
//-- Autor: Miquel Servera
//-- Data: 08-11-2020

`default_nettype none

module pulsador_tic (input wire clk, input wire d, output wire tic);

	//-- Sincronizacion para evitar problemas 
	//-- de la metaestabilidad
	reg d2;
	reg r_in;
	
	always @(posedge(clk))
		d2 <= d;
		
	always @(posedge(clk))
		r_in <= d2;
		
	//-- Circuito antirrebote
	//-- Este produce una señal estable en la salida
	//-- cuando la señal de entrada es inestable
	
	reg btn_prev = 0;
	reg btn_out_r = 0;
	
	reg [16:0] counter = 0;
	
	always @(posedge(clk)) begin
	
		//-- si btn_prev y btn_in son diferentes
		if (btn_prev ^ r_in == 1'b1) begin
		
			//-- reseteamos el contador 
			counter <= 0;
			
			//-- capturamos el estado del boton
			btn_prev <= r_in;
		end
	
	//-- si no hay tiempo de espera se incrementa el contador 
		else if (counter[16] == 1'b0)
			counter <= counter + 1;
			
		else
			//-- establecer la salida con el valor estable
			btn_out_r <= btn_prev;
			
	end
	
	//-- generar tic en flanco de subida del boton
	reg old;
	
	always @(posedge(clk))
		old <= btn_out_r;
		
	assign tic = !old & btn_out_r;
	
endmodule
