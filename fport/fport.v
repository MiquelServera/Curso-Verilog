//-- Fichero Fport
module Fport(output [3:0] data);

wire [3:0] data;	//-- la salida del module son 4 cables

assign data = 4'b1010;	//-- sacar el valor por el bus de salida

endmodule
