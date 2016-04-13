/*UNIVERSIDADE FEDERAL DA FRONTEIRA SUL
 PROFESSOR: EMÍLIO WERGES
 ALUNO: FILIPE DOS REIS SANTOS
 EMAIL: lips.fr@gmail.com
 COMPILADO COM GCC NO AMBIENTE LINUX MINT KDE 17.3*/
 
				/*IMPLEMENTAÇÃO - COMPARAÇÃO ARQUIVO EM C E EM VERILOG*/

#include <stdio.h>
#include <stdlib.h>
#define MAX 700

int main(){
    int j, int vet1[MAX], vet2[MAX];
    
    FILE *A1, *A2, *OUT;

    A1 = fopen("outputc.txt","r");
    A2 = fopen("outputv.txt","r");
    OUT = fopen("compcv.txt","w");
    
    for(j = 0; j < MAX; j++){
        fscanf(A1,"%d",&vet1[j]);
    	fscanf(A2,"%d",&vet2[j]); 
    	
    	if(vet1[j] != vet2[j]){
			fprintf(OUT," Diferenca na linha %d\n", j+1); 
		}                                                
    }
    fclose(A1);
    fclose(A2);
    fclose(OUT);
    
    return 0;
}
