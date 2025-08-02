#include <stdio.h>
#define MAX_SIZE 101

typedef struct {
        int top;
        int arr[MAX_SIZE];
} stack;

static void Push(int data, stack *working_structure) {
        if (working_structure->top == (MAX_SIZE - 1)) {
                puts("Stack full; CRASH INCOMING");
                return;
        } else {
                working_structure->top++;
                working_structure->arr[working_structure->top] = data;
        }
}

static void Pop(stack *working_structure) {
        if (working_structure->top < 0) {
                puts("List is too short; No elements to pop");
                return;
        } else {
                printf("Popping element : %d\n", working_structure->arr[working_structure->top]);
                working_structure->top--;
        }
        puts("");
}

static inline int Top(stack *working_structure) {
        return working_structure->arr[working_structure->top];
}

static void Print(stack *working_structure) {
        int i = 0;
        printf("List : ");
        while (i <= working_structure->top) {
                printf("%d\t", working_structure->arr[i]);
                i++;
        }
        puts("");
}

int main(void) {
        stack main_struct = {.top = -1};

        Push(2, &main_struct);
        Print(&main_struct);

        Push(4, &main_struct);
        Print(&main_struct);

	printf("\nTop Element : %d\n", Top(&main_struct));
	Pop(&main_struct);
	
        Push(6, &main_struct);
        Print(&main_struct);

        Push(8, &main_struct);
        Print(&main_struct);

        printf("\nTop Element : %d\n", Top(&main_struct));
        Pop(&main_struct);

        Push(12, &main_struct);
        Print(&main_struct);
        return 0;
}
