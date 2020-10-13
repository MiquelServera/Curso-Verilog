module TestSR();

	reg S;
	reg R;
	wire Q;
	wire Qbar;
	
	//-- Instanciamos el SR_latch
	sr_latch
	sr(
		.S(S),
		.R(R),
		.Q(Q),
		.Qbar(Qbar)
      );
      
    //-- Iniciamos la simulacion
    initial begin
    	S = 0;
    	R = 0;
    	#2 S = 0;
    	#2 R = 1;
   	 	#4 S = 0;
    	#4 R = 0;
    	#6 S = 0;
    	#6 R = 1;
    	#8 S = 1;
    	#8 R = 0;
    	#10 S = 1;
    	#10 R = 1;
    end
    
    initial
    	$monitor("S= %0d, R= %0d, Q= %0d, Qbar= %0d", S, R, Q, Qbar);
    
endmodule
