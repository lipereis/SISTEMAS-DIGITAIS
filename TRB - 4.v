/*UNIVERSIDADE FEDERAL DA FRONTEIRA SUL
 PROFESSOR: EMÍLIO WERGES
 ALUNO: FILIPE DOS REIS SANTOS
 EMAIL: lips.fr@gmail.com
 COMPILADO COM GCC NO AMBIENTE LINUX MINT KDE 17.3*/
 
				/*IMPLEMENTAÇÃO - TESTE DE COLISÃO NO TRIÂNGULO EM VERILOG*/


/*foi utilizado como referência o arquivo postado pelo professor e a ajuda de colegas*/

module sinal(
    input [11:0]x0,
    input [11:0]y0,
    input [11:0]x1,
    input [11:0]y1,
    input [11:0]x2,
    input [11:0]y2,
    output s
);

wire signed [11:0] d1;
wire signed [11:0] d2;
wire signed [11:0] d3;
wire signed [11:0] d4;

wire signed [23:0] p1;
wire signed [23:0] p2;

  assign d1 = x0 - x2;
  assign d2 = y1 - y2;
  assign d3 = x1 - x2;
  assign d4 = y0 - y2;

  assign p1 = d1 * d2;
  assign p2 = d3 * d4;

  assign s = p1 < p2;
endmodule

module tri(
  input [11:0] x0,
  input [11:0] y0,
  input [11:0] x1,
  input [11:0] y1,
  input [11:0] x2,
  input [11:0] y2,
  input [11:0] x3,
  input [11:0] y3,
  output in
);


wire g1, g2, g3;

sign P1(x0, y0, x1, y1, x2, y2, g1);
sign P2(x0, y0, x2, y2, x3, y3, g2);
sign P3(x0, y0, x3, y3, x1, y1, g3);

assign in = g1 == g2 & g2 == g3;

endmodule

module execute;

integer arq_texto;
integer esc_texto;
integer value;

reg signed [11:0] x0;
reg signed [11:0] y0;
reg signed [11:0] x1;
reg signed [11:0] y1;
reg signed [11:0] x2;
reg signed [11:0] y2;
reg signed [11:0] x3;
reg signed [11:0] y3;
wire out;
reg estado = 0;

tri T(x0, y0, x1, y1, x2, y2, x3, y3, out);

initial begin
  arq_texto = $fopen("inpverilog.txt", "r");
  esc_texto = $fopen("outverilog.txt", "w");
  if (arq_texto == 0) begin
    $display("impossivel abrir arquivo.");
    $finish;
  end else begin
    $display("bem sucedido.");
  end
  if (esc_texto == 0) begin
    $display("impossivel abrir para escrita.");
    $finish;
  end else begin
    $display("abertura para escrita bem sucedida.");
  end
end

always #2 begin
  if (!$feof(arq_texto) begin
	  if (estado != 0)begin

	    $fdisplay(esc_texto, "%d%d %d %d %d %d %d %d = %d",
	      x0, y0, x1, y1, x2, y2, x3, y3, out);

	    value = $fscanf(arq_texto, "%d %d %d %d %d %d %d %d\n",
	      x0, y0, x1, y1, x2, y2, x3, y3);
	  end else begin
		value = $fscanf(arq_texto, "%d %d %d %d %d %d %d %d\n",
	      x0, y0, x1, y1, x2, y2, x3, y3);
		estado = 1;
  	end
  end
  else begin
    $finish;
  end
end

endmodule
