/* class CoffeeMachine {
*   waterAmount = 0; // The amount of water inside
* 
*   constructor(power) {
*     this.power = power;
*     console.log(`Created a coffee machine, ${power}`);
*   }
* }
* coffeeMachine.waterAmount = 200;
* let coffeeMachine = new CoffeeMachine(100);
* 
* const foo = 23;
* foo = 234; */

class CoffeeMachine {
	_waterAmount = 0;

	set waterAmount(value) {
		if (value < 0) {
			value = 0;
		}
		this._waterAmount = value;
	}

	get waterAmount() {
		return this._waterAmount;
	}

	constructor(power) {
		this._power = power;
	}

	/* set power(value) {
	   if(value < 0) { value = 0; }
		this._power = value;
	} */

	// If you want it to be read only then don't add a setter for power.
	get power() {
		return this._power;
	}
}

let coffeeMachine = new CoffeeMachine(100);
coffeeMachine.waterAmount = 1000;
console.log(coffeeMachine.waterAmount);
// To change the value of power of coffee machine
// coffeeMachine.power = xyz; // some value in watts
console.log(coffeeMachine.power);
