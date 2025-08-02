class CoffeeMachine {
	#waterLimit = 200;

	#fixWaterAmount(value) {
		if (value < 0) {
			return 0;
		}
		if (value > this.#waterLimit) {
			return this.#waterLimit;
		}
	}

	/* setWaterAmount(value) {
		this.#waterLimit = this.#fixWaterAmount(value);
	   } */

	// with a Setter
	set WaterAmount(value) {
		if (value < 0) value = 0;
		this.#waterLimit = value;
	}
}

class MegaCoffeeMachine extends CoffeeMachine {
	method() {
		console.log(error);
	    // wateramount was not declared in the current but was tried to be inherited from
	    // it's parent class which is why it was giving an error.
	    // console.log(this.#WaterAmount);
	}
}

let coffeeMachine = new CoffeeMachine();

coffeeMachine.WaterAmount = 100;
// error - cannot access private members outside the class : coffeeMachine.#fixWaterAmount(123);
// error - cannot access private members outside the class : coffeeMachine.#waterLimit = 1000;
