
//self checking test bench for 8*8 dadda
module dadda_tb();


	parameter M=8,N=8;

	reg [N-1:0]P;
	reg [M-1:0]Q;
  wire [N+M-1:0]Y;



	 dadda UUT(.P(P),.Q(Q),.y(Y));


	
	initial
	repeat(15)
	begin
		#10 P = $random; Q = $random;
		#100//give required simulation time to complete the operation one by one.
		#100
		#10
		//-----VERIFICATION OF THE OBTAINED RESULT WITH EXISTING RESULT------
      $display(" P=%d,Q=%d,PxQ=%d",(P),(Q),(Y));

		if( (P)*(Q) != (Y)) 
			$display(" *ERROR* ");

	end

endmodule