#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define MAX_POPRIETARIOS 50

typedef struct{
    char CPF[11];
    char nome[50];
    char telefone[11];
} Proprietario;
Proprietario dono[MAX_POPRIETARIOS];
void menu();
void cadastrar();
void remover();
void listar();
int main()
{
    menu();
    return 0;
}
void menu(){
    int op;
    do{
    system("cls");
    printf("\n1 - Cadastrar\n");
    printf("\n2 - Listar\n");
    printf("\n3 - Remover\n");
    printf("\n0 - Sair\n");
    scanf("%d", &op);
    getchar();
    switch(op){
        case 1:
            cadastrar();
            break;
        case 2:
            listar();
            break;
        case 3:
            //remover();
            break;
        }
    }while(op != 0);

}

void cadastrar(){
    int i;
    char nome[50];
    char CPF[11];
    char telefone[11];
    int op;
    do{
            //system("cls");
            FILE *arquivo;
            arquivo = (fopen("arquivo.txt","a+"));
            printf("\nCPF: ");
            fgets(CPF, sizeof(CPF), stdin);
            printf("\nNome: ");
            fgets(nome, sizeof(nome), stdin);
            printf("\nTelefone: ");
            fgets(telefone, sizeof(telefone), stdin);
            /*for(i=0; i < MAX_POPRIETARIOS; i++)
            {
                strcpy(dono[i].CPF, CPF);
                strcpy(dono[i].nome, nome);
                strcpy(dono[i].telefone, telefone);
                fprintf(arquivo,"%s ",dono[i].CPF);
                fprintf(arquivo,"%s ",dono[i].nome);
                fprintf(arquivo," %s\n",dono[i].telefone);

            }*/

            fwrite(CPF, sizeof(CPF), 1,arquivo);
            fclose(arquivo);

            printf("\n1 - continuar\n2 - Menu\n");
            scanf("%d", &op);

    }while(op != 2);
}/*
void remover(){
    int numero, op;
    do{
            system("cls");
    listar();
    printf("\n Digite o numero do proprietario a ser removido: ");
    scanf("%d", &numero);
    --numero;
    dono[numero].ativo=0;
    printf("Cadastro exluido com sucesso!");
    getchar();
    printf("\n1 - continuar\n0 - Menu\n");
    scanf("%d", &op);
    }while(op!=0);
}*/
void listar(){
    int i, op;
    do{
    system("cls");
    printf("\nLista de Proprietarios\n");
    for (i=0; i < MAX_POPRIETARIOS; i++){
        printf("Proprietario numero: %d\n", i+1);
        printf("Nome: %s\n", dono[i].nome);
        printf("CPF: %s\n", dono[i].CPF);
        printf("Telefone: %s\n", dono[i].telefone);
    }
    printf("\n1 - continuar\n0 - Menu\n");
    scanf("%d", &op);
    }while(op!=0);

}