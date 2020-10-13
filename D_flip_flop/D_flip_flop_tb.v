module testD_flip_flop();
	wire Q;
	wire Qbar;
	reg D;
	reg CLK;
	
//-- Instanciamos el module dff
	dff
	dff0(
		.D(D),
		.CLK(CLK),
		.Q(Q),
		.Qbar(Qbar)
		);
		
//-- Iniciamos la simulacion
	initial begin
		CLK = 0;
		D = 0;
		
		#3 D = 1; 
		#3 D = 0;
		#3 $finish;
		
	end	
	
	always #2 CLK= ~CLK;
	
	initial
		$monitor("CLK=%0d, D=%0d, Q=%0d, Qbar=%0d", CLK, D, Q, Qbar);
		
endmodule
		
