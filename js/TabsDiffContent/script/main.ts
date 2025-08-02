const something: HTMLElement | null = document.getElementById("something");
if(something === null) throw new Error("something doesn't exists");
