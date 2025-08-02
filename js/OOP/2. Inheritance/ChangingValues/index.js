class Animal {
    constructor(name){
	this.name = name;
    }

    printName(){
	console.log(this.name);
    }
}

class Rabbit extends Animal {
    constructor(name){
	super(name);
	this.name = "zebra";
    }

    printName(){
	console.log(this.name);
    }
}

new Animal("Dog").printName();
new Rabbit().printName();
