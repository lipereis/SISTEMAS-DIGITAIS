/*UNIVERSIDADE FEDERAL DA FRONTEIRA SUL
 PROFESSOR: EMÍLIO WERGES
 ALUNO: FILIPE DOS REIS SANTOS
 EMAIL: lips.fr@gmail.com
 COMPILADO COM GCC NO AMBIENTE LINUX MINT KDE 17.3*/
 
						/*IMPLEMENTAÇÃO - TESTE DE COLISÃO NO TRIÂNGULO*/
#include <stdio.h>

int tri_area(int *x1, int *y1, int *x2, int *y2, int  *x3, int *y3){//FUNÇÃO QUE CALCULA A AREA DO TRIANGULO
	int area = (*x1**y2+*x2**y3+*y1**x3)-(*x3**y2+*x2**y1+*y3**x1);
	return area;
}
void test(int *aux){ //TROCANDO O SINAL DA AREA DE UM TRIANGULO RELATIVO CASO A MESMA SEJA MENOR QUE ZERO
	if(*aux < 0){
		*aux = -1**aux;
	}
}

int main(){
	int x1, y1, x2, y2, x3, y3, x, y, arto, arpo = 0, aux;
	
	printf("Insira as coordenadas do triangulo:\n"); 
	scanf("%d%d%d%d%d%d", &x1, &y1, &x2, &y2, &x3, &y3); //LENDO AS COORDENADAS DO TRIANGULO
	printf("Insira a coordenada do ponto a ser testado:\n");
	scanf("%d%d", &x, &y); //LENDO A COORDENADA DO PONTO
	arto = tri_area(&x1, &y1, &x2, &y2, &x3, &y3);
	test(&arto);
	aux = tri_area(&x1, &y1, &x2, &y2, &x, &y);
	test(&aux);
	arpo = aux;
	aux = tri_area(&x1, &y1, &x, &y, &x3, &y3);
	test(&aux);
	arpo = arpo+aux;
	aux = tri_area(&x, &y, &x2, &y2, &x3, &y3);
	test(&aux);
	arpo = arpo+aux;
	if(arpo == arto){ //COMPARA A AREA DO TRIANGULO TOTAL COM A SOMA DAS AREAS DOS TRIANGULOS RELATIVOS AO PONTO TESTADO
		printf("Ponto esta no triangulo\n");
	}else{
		printf("Ponto nao esta no triangulo\n");
	}
	
	return 0;
}
