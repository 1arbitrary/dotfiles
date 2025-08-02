#include <stdio.h>
#include <stdlib.h>

struct Node {
  int data;
  struct Node *next;
};

void Insert(int x, struct Node** ptr_head) {
  struct Node *temp = (struct Node *)malloc(sizeof(struct Node));

  temp->data = x;
  temp->next = *ptr_head;
  *ptr_head = temp;
}

void Print(struct Node* ptr_head) {
  printf("List is : ");
  while (ptr_head != NULL) {
    printf("%d ", ptr_head->data);
    ptr_head = ptr_head->next;
  }
  printf("\n");
}

int main() {
  struct Node* head = NULL;

  printf("Enter the number of elements you want to insert : ");
  int n;
  scanf("%d", &n);
  int x;

  for (int i = 0; i < n; i++) {
    printf("Enter the number you want to insert : ");
    scanf("%d", &x);
    Insert(x,&head);
    Print(head);
  }
  return 0;
}
