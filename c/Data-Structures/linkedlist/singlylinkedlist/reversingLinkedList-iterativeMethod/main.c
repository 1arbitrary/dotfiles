#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct Node {
  int data;
  struct Node *nextNode;
};

void Insert(int data, struct Node **ptr_head) {
  // USE-CASE: TEMPORARY VARIABLE TO STORE THE PREVIOUS ADDRESS
  struct Node *prevAddress;
  struct Node *current = (struct Node *)malloc(sizeof(struct Node));

  // NOTE : THIS IS ALL THE CASES EXCEPT FOR THE FIRST INSERTION
  if ( *(ptr_head) != NULL ) {
    prevAddress->nextNode = current;
    current->data = data;
    current->nextNode = NULL;
    prevAddress = current;
    return;
  }
  // NOTE : THIS IS ONLY FOR THE FIRST CASE OF INSERTION
  current->data = data;
  current->nextNode = NULL;
  *(ptr_head) = current;
  prevAddress = current;
}

// FIX : SEGEMENTATION FAULT (FOR SOME FUCKING REASON)
void reverse_list(struct Node *ptr_head) {
  struct Node *last_node;
  struct Node *reverse_node;
  struct Node *current = ptr_head;

  while (current != NULL) {
    last_node = current;
    current = current->nextNode;
  }
  last_node->nextNode = ptr_head; // 500->nextNode = 100
  // THINK OF SOMETHING THAT MAKES THE ADDRESSES POINT BACKWARDS BEFORE REACHING
  // THE LAST NODE ? MAYBE NOT SURE

  current = ptr_head;

  while(current != last_node){
    reverse_node = current;
    current = current->nextNode;
  }
}

void Print(struct Node *ptr_head) {
  struct Node* current = ptr_head;
  printf("List is : ");

  while (current != NULL) {
    printf("%d\t", current->data);
    current = current->nextNode;
  }

  printf("\n");
}

void free_list(struct Node *ptr_head) {
  struct Node *prevNode;

  while(ptr_head != NULL) {
    prevNode = ptr_head;
    ptr_head = ptr_head->nextNode;
    free(prevNode);
  }
}

int main() {
  struct Node *head = NULL;
  Insert(2, &head);
  Insert(4, &head);
  Insert(6, &head);
  Insert(5, &head);
  Print(head);
  reverse_list(head);
  Print(head);
  //free_list(head);

  return 0;
}
