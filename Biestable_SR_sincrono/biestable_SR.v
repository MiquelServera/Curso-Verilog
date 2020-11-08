//-- Archivo: biestable_SR.v
//-- Autor: Miquel Servera
//-- Data: 08-11-2020

`default_nettype none

module biestable_SR (input wire clk, input wire set, input wire rst, output reg q);
 
 always @(posedge(clk))
 	if (set)
 		q <= 1'b1;
 	else if (rst)
 		q <= 1'b0;
 		
endmodule
 		
 		
