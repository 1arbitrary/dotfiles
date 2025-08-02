class Animal {
	constructor(name) {
		this.speed = 0;
		this.name = name;
	}
	run(speed) {
		this.speed = speed;
		console.log(`${this.name} runs with speed ${this.speed}.`);
	}

	stop() {
		this.speed = 0;
		console.log(`${this.name} stands still.`);
	}
}

class Rabbit extends Animal {
	hide() {
		console.log(`${this.name} hides!`);
	}

	// Overriding a method, by defining it in class Rabbit so that it doesn't inherit the method from Class Animal/ Parent class
	/* stop() {
		this.speed = 0;
		console.log(`${this.name} stands still using the stop method of class Rabbit.`);
	   } */

	// Using the super Keyword :
	/* stop() {
		super.stop(); // using the parent class's stop method
		this.hide();
	} */
    // for an instance, let's say if we have an arrow function :
    stop(){
	setTimeout(()=> super.stop(), 10000);
    }

    // 
}

/* Let animal = new Animal("My Animal");
* animal.run(`30 mph`);
* animal.stop(); */

function f(phrase) {
	return class {
		sayHi() { console.log("Hello " + phrase); }
	};
}

class User extends f("Bitch") {}

let rabbit = new Rabbit("White Rabbit");

// This also has access to prototype functions from Class Animal as class Rabbit inherits from class Animal
rabbit.run(5);
rabbit.hide();
rabbit.stop();

new User().sayHi();
