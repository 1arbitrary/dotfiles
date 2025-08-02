#include <stdio.h>
#include <stdlib.h>

struct Node {
	int data;
	struct Node* next;
};

struct Node* head;

void Print(){
	struct Node* current = head;
	printf("List is : ");
	while(current != NULL){
	  printf("%d\t", current->data);
	  current = current->next;
	}
	printf("\n");
}

void Insert(int data){
	struct Node* prevAddress;
	struct Node* current = (struct Node*)malloc(sizeof(struct Node));

// NOTE : ALL CASES EXCEPT FOR THE FIRST ONE
	if(head != NULL){
		prevAddress->next = current;
		current->data = data;
		current->next = NULL;
		prevAddress = current;
	} else {
		// NOTE : THIS IS THE FIRST CASE
		current->data = data;
		current->next = NULL;
		head = current;
		prevAddress = current;
	}
}

void Delete(int n){
   struct Node* current = head;

	if(n == 1){
           head = current->next;
	   free(current);
	   return;
	}

	for(int i = 0 ; i < (n-2) ; i++){
	   current = current->next;
	}
   
   // temp1 points to (n-1)th Node
   struct Node* newNode = current->next;
   current->next = newNode->next; // (n+1)th Node

   free(newNode);
}

void free_list(){
	struct Node* current = head;
	struct Node* newNode;

	while(current != NULL){
		newNode = current;
		current = current->next;
		free(newNode);
	}
}

int main() {
	head = NULL;
	Insert(2);
	Insert(4);
	Insert(6);
	Insert(5);

	Print();

	printf("Enter the position at which you want to delete a node : ");
	int n;
	scanf("%d", &n);

	Delete(n);
	Print();

	free_list();

	return 0;
}
