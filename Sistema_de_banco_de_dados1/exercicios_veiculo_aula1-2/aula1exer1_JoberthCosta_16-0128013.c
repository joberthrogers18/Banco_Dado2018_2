#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct pessoa {
    char nome[60];
    int telefone;
    int cpf;
    struct contato *prox;
    struct contato *ant;

} Pessoa;

typedef struct automovel{
        char modelo[60];
        char marca[60];
        int cpf_proprietario;
        int ano;
        int renavam;
        struct automovel *prox;
        struct automovel *ant;
} Automovel;

Pessoa *cria_lista_pessoa();
Automovel *cria_lista_automovel(); 
Pessoa *insere_pessoa_no_inicio_da_lista(Pessoa *lista, Automovel *carros);
Automovel *insere_automovel_no_inicio_da_lista(Automovel *carros, int cpf); 
void imprimir_Pessoas(Pessoa *lista, Automovel *carro );
void imprimir_Automoveis(Automovel *lista, int cpf);
Pessoa *abre_arquivo();
void escreve_arquivo_pessoa(Pessoa *lista_de_Pessoas);
void escreve_arquivo_automovel(Automovel *carros);
void free_lista_de_Pessoas(Pessoa *lista_de_Pessoas);
void free_lista_de_Automoveis(Automovel* carros);
Pessoa *abre_arquivo_Pessoa(Pessoa *lista_de_pessoas);
Pessoa *abre_arquivo_Automovel(Automovel *free_lista_de_Automoveis);
Pessoa *insere_pessoa_abrirarq(Pessoa *lista, int cpf, int telefone, char *nome);
Automovel *insere_automovel_abrirarq(Automovel *carros,int cpf_proprietario,char *modelo,char* marca,int ano,int renavam);
void menu();

int main () {

  char seletor = 'P';

 Pessoa *lista_de_pessoas = cria_lista_pessoa();
 Automovel *lista_de_automoveis = cria_lista_automovel();

 lista_de_pessoas = abre_arquivo_Pessoa(lista_de_pessoas);
 lista_de_pessoas = abre_arquivo_Automovel(lista_de_automoveis);

  while (seletor != '3')  {
    menu();
    scanf(" %c", &seletor);
    if (seletor == '1') {
      lista_de_pessoas = insere_pessoa_no_inicio_da_lista(lista_de_pessoas, lista_de_automoveis);

      int opcao;

      while(1){
        printf("Deseja cadastrar o carro? 1/s ou 2/n");
        scanf("%d", &opcao);
        if(opcao != 1) break;
        lista_de_automoveis = insere_automovel_no_inicio_da_lista(lista_de_automoveis, lista_de_pessoas->cpf);
      }

        printf("cadastrado com sucesso!");
    }
    else if (seletor == '2') {
      imprimir_Pessoas(lista_de_pessoas, lista_de_automoveis);
    }
    else if (seletor == '3') {
      escreve_arquivo_pessoa(lista_de_pessoas);
      escreve_arquivo_automovel(lista_de_automoveis);
      free_lista_de_Pessoas(lista_de_pessoas);
      break;
    }
    else {
      printf("Opção inválida!\n");
    }
  }

  return 0;
}


Pessoa *abre_arquivo_Pessoa(Pessoa *lista_de_pessoas) {
  FILE *fp;
  Pessoa *pessoa = cria_lista_pessoa();

  fp = fopen("pessoas.txt", "r");
  
  char nome [101];
  int telefone;
  int cpf; 
  char c;

  if (fp == NULL) {
    fp = fopen("pessoas.txt", "w");
  }
  
  if (fp == NULL) {
    fp = fopen("pessoas.txt", "w");
  }

  while (c != EOF) {

    fscanf(fp, " %[^\n]", nome);
    fscanf(fp, " %d", &telefone);
    fscanf(fp, " %d", &cpf);

    c = fgetc(fp);
    c = fgetc(fp);

    if (c == EOF) {
      break;
    }

    pessoa = insere_pessoa_abrirarq(lista_de_pessoas,cpf,telefone,nome);

  }

  fclose(fp);

  return pessoa;
}

Pessoa *abre_arquivo_Automovel(Automovel *carros) {
  FILE *fp;
  Automovel *carro = cria_lista_automovel();

  fp = fopen("automoveis.txt", "r");
  
  char modelo[60];
  char marca[60];
  int cpf_proprietario;
  int ano;
  int renavam;
  char c;
  
  if (fp == NULL) {
    fp = fopen("automoveis.txt", "w");
  }

  while (c != EOF) {

    fscanf(fp, " %d", &cpf_proprietario);
    fscanf(fp, " %[^\n]", modelo);
    fscanf(fp, " %[^\n]", marca);
    fscanf(fp, " %d", &ano);
    fscanf(fp, " %d", &renavam);

    c = fgetc(fp);
    c = fgetc(fp);

    if (c == EOF) {
      break;
    }

    carros = insere_automovel_abrirarq(carros,cpf_proprietario,modelo,marca, ano, renavam);

  }

  fclose(fp);

  return carro;
}


Pessoa *insere_pessoa_abrirarq(Pessoa *lista, int cpf, int telefone, char *nome) {
  Pessoa *pessoa = (Pessoa *)malloc(sizeof(Pessoa));

  strcpy(pessoa->nome,nome);
  pessoa->telefone = telefone;
  pessoa->cpf = cpf;
  pessoa->prox = NULL;
  pessoa->ant = NULL;

  // Se a lista já tiver algum Pessoa.
  if (lista != NULL) {
    lista->ant = pessoa;
    pessoa->prox = lista;
  }

  return pessoa;
}

Automovel *insere_automovel_abrirarq(Automovel *carros,int cpf_proprietario,char *modelo,char* marca,int ano,int renavam){
    Automovel *automovel = (Automovel *)malloc(sizeof(Automovel));

    automovel->cpf_proprietario = cpf_proprietario;
    automovel->ano = ano;
    automovel->renavam = renavam;
    strcpy(automovel->modelo, modelo);
    strcpy(automovel->marca, marca);

  if (carros != NULL) {
    carros->ant = automovel;
    automovel->prox = carros;
  }

  return automovel;
}

void imprimir_Pessoas(Pessoa *lista, Automovel *carro) {

  Pessoa *atual = lista;
  
  if (atual == NULL) {
    puts("\nLista de Pessoas vazia!\n");
  }

  while (atual != NULL) {

    printf("---Proprietario---\n");
    printf("Nome: %s\n", atual->nome);
    printf("CPF: %d\n", atual->cpf);
    printf("Telefone: %d\n", atual->telefone);

    imprimir_Automoveis(carro, atual->cpf);

    atual = atual->prox;
  }
}

void imprimir_Automoveis(Automovel *carros, int cpf) {

  Automovel *atual = carros;

  if (atual == NULL) {
    puts("\nLista de Automoveis vazia!\n");
  }


  while (atual != NULL) {

    if(atual->cpf_proprietario == cpf){
      printf("---Automovel---\n");
      printf("Modelo: %s\n", carros->modelo);
      printf("Marca: %s\n", carros->marca);
      printf("Ano: %d\n", carros->ano);
      printf( "Renavam: %d\n", carros->renavam);
    }

    atual = atual->prox;
  }
  printf("\n\n");
}


Pessoa *insere_pessoa_no_inicio_da_lista(Pessoa *lista, Automovel* carros) {
  int tel, cpf;
  Pessoa *pessoa = (Pessoa *)malloc(sizeof(Pessoa));

  printf("Nome: ");
  scanf("%s", pessoa->nome);
  printf("Telefone: ");
  scanf("%d", &tel);
  printf("CPF: ");
  scanf("%d", &cpf);
  pessoa->telefone = tel;
  pessoa->cpf = cpf;
  pessoa->prox = NULL;
  pessoa->ant = NULL;

  if (lista != NULL) {
    lista->ant = pessoa;
    pessoa->prox = lista;
  }

  return pessoa;
}

Automovel *insere_automovel_no_inicio_da_lista(Automovel *carros, int cpf) {
  int renavam, ano;
  Automovel *automovel = (Automovel *)malloc(sizeof(Automovel));

  printf("Modelo: ");
  scanf("%s", automovel->modelo);
  printf("Marca: ");
  scanf("%s", automovel->marca);
  printf("Ano: ");
  scanf("%d", &ano);
  printf("Renavam: ");
  scanf("%d", &renavam);
  automovel->renavam = renavam;
  automovel->ano =ano;
  automovel->cpf_proprietario = cpf;
  automovel->prox = NULL;
  automovel->ant = NULL;

  // Se a lista já tiver algum Pessoa.
  if (carros != NULL) {
    carros->ant = automovel;
    automovel->prox = carros;
  }

  return automovel;
}

void escreve_arquivo_pessoa(Pessoa *lista_de_contatos) {

  FILE *fp;

  fp = fopen("pessoas.txt", "w");

  if (fp == NULL) {
    printf("Falhou ao criar o arquivo.\n");
  }

  while (lista_de_contatos != NULL) {

    fprintf(fp, "%s\n", lista_de_contatos->nome);
    fprintf(fp,"%d\n", lista_de_contatos->telefone);
    fprintf(fp,"%d\n$\n", lista_de_contatos->cpf);

    lista_de_contatos = lista_de_contatos->prox;
  }
  fclose(fp);
}

void escreve_arquivo_automovel(Automovel *carros) {

  FILE *fp;

  fp = fopen("automoveis.txt", "w");

  if (fp == NULL) {
    printf("Falhou ao criar o arquivo.\n");
  }

  while (carros != NULL) {

    fprintf(fp, "%d\n", carros->cpf_proprietario);
    fprintf(fp, "%s\n", carros->modelo);
    fprintf(fp,"%s\n", carros->marca);
    fprintf(fp,"%d\n", carros->ano);
    fprintf(fp, "%d\n$\n", carros->renavam);
    carros = carros->prox;
  }
  fclose(fp);

}

Pessoa *cria_lista_pessoa() {
  return NULL;
}

Automovel *cria_lista_automovel() {
  return NULL;
}

void free_lista_de_Pessoas(Pessoa *lista_de_Pessoas) {

	while (lista_de_Pessoas != NULL) {
		Pessoa *atual = lista_de_Pessoas;
		lista_de_Pessoas = lista_de_Pessoas->prox;

		free(atual);
	}
}

void free_lista_de_Automoveis(Automovel *carros) {

	while (carros != NULL) {
		Automovel *atual = carros;
		carros = carros->prox;

		free(atual);
	}
}

void menu() {
  printf("\n-------------------------------------------------------------------------------------------\n");
  printf("Gerenciador de automoveis \n");
  printf("1) Inserir novo Proprietario\n");
  printf("2) Visualizar Proprietarios\n");
  printf("3) Sair\n");
}