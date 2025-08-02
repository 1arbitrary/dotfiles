#include <stdio.h>
#include <stdlib.h>

struct Node {
  int data;
  struct Node *nextNode;
};

void Insert(int data, struct Node **ptr_head) {
  struct Node *prevNode;
  struct Node *current = (struct Node *)malloc(sizeof(struct Node));

    if (*(ptr_head) != NULL) {
	prevNode->nextNode = current;
	current->data = data;
	current->nextNode = NULL;
	prevNode = current;
    } else {

	current->data = data;
	current->nextNode = NULL;
	prevNode = current;
	*(ptr_head) = current;
    }
}

void Print(struct Node *ptr_head) {
  printf("List is : ");
  while (ptr_head != NULL) {
    printf("%d\t", ptr_head->data);
    ptr_head = ptr_head->nextNode;
  }
  printf("\n");
}

int main() {
  struct Node *head = NULL;
  Insert(2, &head);
  Insert(4, &head);
  Insert(6, &head);
  Insert(5, &head);
  Print(head);

  return 0;
}
