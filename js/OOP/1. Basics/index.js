/* class Rectangle {
* 	// This is just a basic constructor implementation using the constructor keyword
* 	constructor(height, width) {
* 		this.height = height;
* 		this.width = width;
* 	}
* 
p* 	// This is a public function
* 	Printdimensions() {
* 		console.log("Height x Width : " + this.height + " x " + this.width);
* 	}
* }
* 
* const rect = new Rectangle(22, 33);
* rect.Printdimensions();
* 
* rect.SayHello(); */


// Implementation of a Class named User

class User {
	constructor(name) {
		this.name = name;
	}

	// Computed Names using brackets

	/*
	   ['Say' + 'Hi'] (){
		  alert("Hello"); // unhinged block of code
	   }
	 */

	set name(value) {
		if (value.length < 4) {
			console.log("Name is too short; Try Again !");
			return;
		} else {
		    this._name = value.toUpperCase();
		}
	}

	get foo() {
		return this._name.toUpperCase(); 
	}

    SayHi(){
	console.log(`The name is ${this._name}`);
    }
}

class student extends User {
    constructor(name){
	super.name = name;
    }
}

const user1 = new User("Johnny");
console.log(user1.name); // Makes a call to the getter and not to the setter .........
