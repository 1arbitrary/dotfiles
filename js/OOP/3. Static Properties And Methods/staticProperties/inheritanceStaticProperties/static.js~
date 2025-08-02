 class Animal {
    static planet = "earth";

    constructor(name, speed){
	this.speed = speed;
	this.name = name;
    }

    run(speed = 0){
	this.speed += speed;
	console.log(`${this.name} runs with ${this.speed}.`);
    }

    static compare(animalA, animalB){
	return (animalA.speed - animalB.speed);
    }
}

// Inherit from class Animal
class Rabbit extends Animal {
    hide(){
	console.log(`${this.name} hides.`);
    }
}

let rabbits = [
	new Rabbit("White Rabbit", 10),
	new Rabbit("Black Rabbit", 5)
];

// This basically compares both the animals and places them accordingly, based on the value they give after evaluation
rabbits.sort(Rabbit.compare);
rabbits[0].run(); // Black Rabbit runs with speed 5
console.log(Rabbit.planet);
