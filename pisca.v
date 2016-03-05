module piscaluz (
	input clk,
	output pis);

	assign pis = clk;

endmodule

module test(output v);

	reg clk;
	always #2 clk <= ~clk;

	wire pis;
	piscaluz P(clk, pis);
	
	initial begin
		$dumpvars(0, P);
		#1;
		clk <= 0;
		#500;
		$finish;
	end
endmodule
