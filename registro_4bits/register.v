//-- Fichero register_4bits.v
module register_4bits(input wire clk, output wire [3:0] data);

parameter N = 22;	//-- bits del prescaler

wire clk_base;		//-- reloj principal (prescalado)

reg [3:0] dout = 4'b0101;	//-- datos del registro
wire[3:0] din;		//-- cable de entrada al registro

//-- Instanciamos el prescaler
prescaler #(.N(N))
PRES (
	.clk_in(clk),
	.clk_out(clk_base)
);

//-- Registro
always @(posedge clk_base) begin
	dout <= din;
end

//-- Puerta NOT entre la salida y la entrada
assign din = ~dout;

//-- Sacamos los datos del registro por la salida
assign data = dout;

endmodule
