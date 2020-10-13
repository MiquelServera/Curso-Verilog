module testD_latch();
	wire Q;
	wire Qbar;
	reg D;
	reg EN;
	
//-- Instanciamos el module D_latch
	d_latch
	d0(
		.D(D),
		.EN(EN),
		.Q(Q),
		.Qbar(Qbar)
	  );
	  
//-- Iniciamos la simulacion
	initial begin
		D = 0;
		EN = 0;
		
		#2 D = 0;
		#2 EN = 0;
		
		#4 D = 0;
		#4 EN = 1;
		
		#6 D = 1;
		#6 EN = 0;
		
		#8 D = 1;
		#8 EN = 1;
		
	end
	
	initial
		$monitor("D=%0d, EN=%0d, Q=%0d, Qbar=%0d", D, EN, Q, Qbar);
		
endmodule	
