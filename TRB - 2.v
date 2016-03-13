module contador(
	input [0:0] CLOCK_50,
	input [0:0] KEY,
	output [0:0] LEGD);
	
	reg light = 0;
	reg [25:0] count;
	assign LEDG = light;
	
	always @(posedge CLOCK_50, KEY) begin
		if(KEY == 1) begin
			count <= 0;
			light <= 0;
		end else begin
			if(count == 50000000) begin
				light <= ~light;
				count <= 0;
			end else begin
				count <= count+1;
			end	
		end
	end	
endmodule

module teste;
	reg CLOCK_50;
	reg KEY;
	wire light;
	
	always #1 CLOCK_50 <= ~CLOCK_50;
	
	contador C(CLOCK_50, KEY, light);
	
	initial begin
	$dumpvars(0, C);
	#0
	KEY <= 1;
	CLOCK_50 <= 0;
	#1
	KEY <= 0;
	#5000
	$finish;
	end
endmodule
