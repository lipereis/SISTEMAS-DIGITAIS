module contador(
	input clk,
	input reset,
	output lightonoff);
	
	reg light;
	reg [25:0] count;
	assign lightonoff = light;
	
	always @(posedge clk, reset) begin
		if(reset == 1) begin
			count <= 0;
			light <= 0;
		end else begin
			if(count == 50) begin
				light <= ~light;
				count <= 0;
			end else begin
				count <= count+1;
			end	
		end
	end	
endmodule

module teste;
	reg clk;
	reg reset;
	wire light;
	
	always #1 clk <= ~clk;
	
	contador C(clk, reset, light);
	
	initial begin
	$dumpvars(0, C);
	#0
	reset <= 1;
	clk <= 0;
	#1
	reset <= 0;
	#5000
	$finish;
	end
endmodule
