#include <stdio.h>
#include <stdlib.h>

struct Node {
  int data;
  struct Node *next;
};

void Print(struct Node* ptr_head) {
  printf("List is : ");
  while (ptr_head != NULL) {
    printf("%d ", ptr_head->data);
    ptr_head = ptr_head->next;
  }
  printf("\n");
}

void free_list(struct Node* ptr_head) {
  struct Node *next;

  while (ptr_head != NULL) {
    next = ptr_head;
    ptr_head = ptr_head->next;
    free(next);
  }
}

void Insert(int data, int n, struct Node** ptr_head) {

  struct Node *temp1 = (struct Node *)malloc(sizeof(struct Node));

  temp1->data = data;
  temp1->next = NULL;

  if (n == 1) {
    temp1->next = *ptr_head;
    *ptr_head = temp1;
    return;
  }

  struct Node *temp2 = *ptr_head;

  for (int i = 0; i < (n - 2); i++) {
    temp2 = temp2->next;
  }

  temp1->next = temp2->next;
  temp2->next = temp1;
}

int main() {
  struct Node* head = NULL;
  Insert(2, 1, &head);
  Insert(3, 2, &head);
  Insert(4, 1, &head);
  Insert(5, 2, &head);
  Print(head);
  free_list(head);
  return 0;
}
