// Mixin

let sayHiMixin = {
	sayHi() {
		console.log(`Hello ${this.name}`);
	},
	sayBye() {
		console.log(`Bye ${this.name}`);
	}
};

// Usage

class User {
	constructor(name) {
		this.name = name;
	}
}

// This basically makes mixin functions methods of class User
// There’s no inheritance, but a simple method copying.
Object.assign(User.prototype, sayHiMixin);

new User("Dude")
	.sayBye();

console.log(User.prototype);
