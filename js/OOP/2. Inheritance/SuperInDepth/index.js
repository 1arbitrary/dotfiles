/* let animal = {
* 	name: "Animal",
* 	eat() {
* 		console.log(`${this.name} eats.`);
* 	}
* };
* 
* let rabbit = {
* 	__proto__: animal,
* 	name: "Rabbit",
* 	eat() {
* 		super.eat();
* 	}
* };
* 
* let longEar = {
* 	__proto__: rabbit,
* 	name: "Long Ear",
* 	eat() {
* 		super.eat();
* 	}
* };
* 
* //rabbit.eat();
* longEar.eat(); */


// Example of a wrong super result after copying

let animal = {
    sayHi(){
	console.log(`I'm an animal`);
    }
};

let rabbit = {
    __proto__: animal,
    sayHi(){
	super.sayHi();
    }
};

let plant = {
    sayHi(){
	console.log(`I'm a plant`);
    }
};

let tree = {
    __proto__ : plant,
    sayHi: rabbit.sayHi
};

tree.sayHi();

// This would print i'm an animal instead as the rabbit proto is animal and it'll make a call to animal
