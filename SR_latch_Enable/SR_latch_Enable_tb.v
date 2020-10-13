module TestSR_EN();

	reg R;
	reg S;
	reg EN;
	wire Q;
	wire Qbar;
	
	//-- Instanciamos el module sr_latch_en
	sr_latch_en
	sr0(
		.R(R),
		.S(S),
		.EN(EN),
		.Q(Q),
		.Qbar(Qbar)
	);
	
	//-- Iniciamos la simulacion
	initial begin
		R = 0;
		S = 0;
		EN = 0;
		
		#2 R = 0;
		#2 S = 0;
		#2 EN = 1;
		
		#4 R = 0;
		#4 S = 1;
		#4 EN = 0;
		
		#6 R = 0;
		#6 S = 1;
		#6 EN = 1;
		
		#8 R = 1;
		#8 S = 0;
		#8 EN = 0;
		
		#10 R = 1;
		#10 S = 0;
		#10 EN = 1;
		
		#12 R = 1;
		#12 S = 1;
		#12 EN = 0;
		
		#14 R = 1;
		#14 S = 1;
		#14 EN = 1;
		
	end
	
	initial
		$monitor("R=%0d, S=%0d, EN=%0d, Q=%0d, Qbar=%0d", R, S, EN, Q, Qbar);
		
endmodule	
		
