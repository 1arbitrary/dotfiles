// Declaring a mixin 
let mixin = {
	// to create a new function 
	on(eventName, handler) {
		// if the event handler doesn't exists, it creates a new one
		if (!this._eventHandlers) this._eventHandlers = {};
		// if the eventHandler[eventName] does not exist it creates a new one
		if (!this._eventHandlers[eventName]) {
			this._eventHandlers[eventName] = [];
		}
		// Once this._eventHandlers[eventName] exists, it pushes the handler( whatever function has to be performed inside it. )
		this._eventHandlers[eventName].push(handler);
	},
	// To turn off an event
	off(eventName, handler) {
		let handlers = this._eventHandlers?.[eventName];
		// if handlers is false; just return
		if (!handlers) return;
		// else run a loop and delete the last element of the array
		for (let i = 0; i < handlers.length; i++) {
			// if it matches just decrement the array's length
			if (handlers[i] === handler) {
				handlers.splice(--i, 1);
			}
		}
	},
	// To trigger an event
	trigger(eventName, ...args) {
		/// if the eventHandlers?.[eventName] doesn't exists return
		if (!this._eventHandlers?.[eventName]) return;
		// Otherwise 
		this._eventHandlers[eventName].forEach(handler => handler.apply(this, args));
	},
};

class Menu {
	choose(value) {
		this.trigger("select", value);
	}
}

Object.assign(Menu.prototype, eventMixin);

let menu = new Menu();
menu.on("select", value => console.log(`Value Selected : ${value}`));
menu.choose("123");
