# Constructor Keyword
- <code>constructor (){}</code>


# Getters & Setters

## Definitions :
- Get : read the value of an object's property
- Set : write the value of an object's property

# Setters :

- A setter lets you define logic to set or modify a property's value.

- You assign it to a property like (Object.prop = value), but it runs a function.

- Example: this.prop = someValue;

<pre>
	class Person {
		set name (value){
		if (value.length < 2) {
			console.log("Name is too short");
	   } else {
		   this._name = value;
	   } 
   }
}

const p = new Person();
p.name = 'A';
p.name = 'Alice';
</pre>


# Getters :

- A Getter lets you define logic to return property's value.

- You access it like a normal property (Obj.prop), but it runs a function under the hood

<pre>
	class Person {
	constructor (name) {
	this._name = name;
	}

	get name(){
	  return this._name.toUppercase(); // returns transformed value
	}
}
const p = new Person("Alice");
console.log(p.name); // -> Alice
</pre>


>> Important Points 

> Use an underscore <code>_property</code> to store the actual value, so that the getter setter don't call them recursively

> Getters must return a value, setters do not return a value (They just accept a value)

> Why Not Using _property Causes Recursion : 
   
   When you define a getter or setter for a property name, and inside
   that getter or setter, you access or assign this.name, you're
   calling the same getter or setter again, leading to infinite
   recursion (until a stack overflow).

<pre>
class Person {
  set name(value) {
    // WRONG: this calls the setter again!
    this.name = value;
  }

  get name() {
    // WRONG: this calls the getter again!
    return this.name;
  }
}
</pre>
