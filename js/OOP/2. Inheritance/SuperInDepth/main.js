let animal = {
	name: "Animal",
	eat() {
		console.log(`${this.name} eats.`);
	}
};

let rabbit = {
	__proto__: animal,
	name: "Rabbit",
	eat() {
		this.__proto__.eat.call(this);
		/*
		   When this method is called :
		   this.__proto__ is just animal as we pass the of proto as animal;
		   then it class animal.eat(this) in which this is the Object: Rabbit;
		   from there it take this name of that with the help of this.name = "Rabbit"
		 */
	}
};

let longEar = {
	__proto__: rabbit,
	eat() {
		this.__proto__.eat.call(this);
	}
};

//rabbit.eat();
longEar.eat();
