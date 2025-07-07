type Pizza = {
    name: string;
    price: number;
};

type Order = {
    id: number;
    pizza: Pizza;
    status: string;
}

let cashInRegister: number = 100;
let orderHistory: Order[] = [];
let nextOrderId: number = 1;

const menu: Pizza[] = [
	{ name: "Margherita", price: 8 },
	{ name: "Pepperoni", price: 10 },
	{ name: "Hawaiian", price: 10 },
	{ name: "Veggie", price: 9 },
];

function addNewPizza(pizzaObj: Pizza) {
	menu.push(pizzaObj);
}

function placeOrder(pizzaName: string) {
	const selectedPizza = menu.find(pizzaObj => pizzaObj.name === pizzaName);
	if (selectedPizza === undefined) {
		console.error(`${pizzaName} does not exist in the menu`);
		return;
	}
	cashInRegister += selectedPizza.price;
	const newOrder: Order = {
		pizza: selectedPizza,
		status: "Ordered",
		id: nextOrderId++
	};
	orderHistory.push(newOrder);
	return newOrder;
}

function completeOrder(orderId: number) {
	const order = orderHistory.find(currentOrder => currentOrder.id === orderId);
	if (order === undefined) {
		console.error(`${order} does not exist in the orderHistory`);
		return;
	}
	order.status = "Completed";
	return order;
}

addNewPizza({ name: "Chicken Bacon Ranch", price : 12 });
addNewPizza({ name: "BBQ Chicken", price : 12 });
addNewPizza({ name: "Spicy Sausage", price : 11 });

placeOrder("Chicken Bacon Ranch");
completeOrder(1);

console.log("Menu : ", menu);
console.log("Cash in Register : ", cashInRegister);
console.log("Order History : ", orderHistory);
