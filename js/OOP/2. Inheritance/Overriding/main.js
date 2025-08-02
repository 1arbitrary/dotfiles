/* class Animal {
*     name = "animal";
*     constructor(){
* 	console.log(this.name);
*     }
* }
* 
* class Rabbit extends Animal {
*     name = 'rabbit';
 * } */

class Animal {
	constructor() {
		this.showName();
	}

	showName() {
		console.log("Animal");
	}
}

class Rabbit extends Animal {

	// What's happening here :
	/*
	   constructor(...args){
	   super(...args);  Here super is making a call to the constructor of the parent class
	   }

	   and then from there it goes to the constructor of the parent class and calls this.showName of the class Rabbit
	 */
	showName() {
		console.log("Rabbit");
	}
}

new Animal();
new Rabbit();
