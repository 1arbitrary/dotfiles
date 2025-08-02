// Use cases are written the comments.

/* Subscribe to event , usage:
 menu.on('select', function(item) {...})*/

let eventMixin = {
	on(eventName, handler) {
		// You can create new properties in javascript at runtime
		// If this._eventHandlers doesn't exist then it creates one.
		if (!this._eventHandlers) this._eventHandlers = {};
		if (!this._eventHandlers[eventName]) { // if it doesn't exists it creates : this._eventHandlers["select"]
			this._eventHandlers[eventName] = []; // should push the handlers into the array
		}
		this._eventHandlers[eventName].push(handler); // this._eventHandlers["select"].push(console.log(`Value Selected : ${value}`));
	},

	/* Cancel the subscription, usage :
	 menu.off('select', handler)*/

	off(eventName, handler) {
		let handlers = this._eventHandlers?.[eventName];
		if (!handlers) return; // if handlers === false
		for (let i = 0; i < handlers.length; i++) { // this.[select] = console.log(...);
			if (handlers[i] === handler) { 
				handlers.splice(--i, 1);
			}
		}
	},

	/* Generate an event with the given name and data
	 this.trigger('select', data1, data2)*/
	trigger(eventName, ...args) {
		if (!this._eventHandlers?.[eventName]) {
			return; // no handlers for that event
		}
		// Call the handlers
		this._eventHandlers[eventName].forEach(handler => handler.apply(this, args));
	}
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
