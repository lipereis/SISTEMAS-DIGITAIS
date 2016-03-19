/*UNIVERSIDADE FEDERAL DA FRONTEIRA SUL
 PROFESSOR: EMILIO WUERGES
 ALUNO: FILIPE DOS REIS SANTOS
 EMAIL: lips.fr@gmail.com
 DESENVOLVIDO NO AMBIENTE LINUX MINT KDE 17.3*/
 
						/*TRABALHO 2 - APLICAÇÃO TO TRABALHO 1 NA PLACA DE FPGA*/
module contador(
	input CLOCK_50,
	output [0:0] LEGD);
	
	reg light = 0;
	reg [25:0] count;
	assign LEDG = light;
	
	always @(posedge CLOCK_50) begin
		if(count == 50000000) begin
			light <= ~light;
			count <= 0;
		end else begin
			count <= count+1;
		end
	end	
endmodule

/*module teste;
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
endmodule*/
