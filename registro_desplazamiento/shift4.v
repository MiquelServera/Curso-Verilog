//-- Fichero shift4.v
module shift4(input wire clk, output reg [3:0] data);

//-- Parametros del secuenciador
parameter NP = 21;	//-- bits del prescaler
parameter INI = 1;	//-- valor inicial a cargar en el registro

wire clk_pres;		//-- reloj de salida del prescaler

//-- Instanciamos el prescaler de N bits
prescaler #(.N(NP))
pres (
	.clk_in(clk),
	.clk_out(clk_pres)
);

//-- Shift/load. Señal que indica si el registro
//-- se carga o desplaza.
//-- shift = 0: carga
//-- shift = 1: desplaza
reg load_shift = 0;

//-- Inicializador
always @(posedge clk_pres) begin
	load_shift <= 1;
end

//-- Registro de desplazamiento
always @(posedge clk_pres) begin
	if (load_shift == 0) //-- load mode
		data <= INI;
	else
		data <= {data[2:0], serin};
end

wire serin;	//-- entrada serie del registro

assign serin = data[3];		//-- la salida de mayor peso se re-introduce por 
				//-- la entrda serie
endmodule

