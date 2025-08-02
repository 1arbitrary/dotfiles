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

// generated for extending classes without own constructors; In other words : This is generated when the child class has no constructor
/* class Rabbit extends Animal {
*     constructor(...args){
* 	super(...args);
*     }
 * } */

class Rabbit extends Animal {
	constructor(name, earLength, speed) {
		//		this.name = name;// This will result in an error; constructors in inherting classes must call the super keyword, before doing 'this'.
		super(name, speed); // To inherit the variable from the parent class
		this.earLength = earLength;
	}
}

let rabbit = new Rabbit("White Rabbit", 10);
console.log(rabbit.name);
console.log(rabbit.earLength);
console.log(rabbit.speed + ' mph');
