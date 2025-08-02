// Built in classes like Array, map are extendable too.
class PowerArray extends Array {
	isEmpty() {
		return this.length === 0;
	}
	// built-in methods would use this as constructor
	static get [Symbol.species]() {
		return Array;
	}
}

let arr = new PowerArray(1, 2, 5, 10, 50);
console.log(arr.isEmpty());


const filteredArray = arr.filter(item => item >= 10);
console.log(filteredArray);
// error : isEmpty is not a function 
// console.log(filteredArray.isEmpty());

// fix : let filteredArray = new PowerArray(arr.filter(item => item >= 10));
