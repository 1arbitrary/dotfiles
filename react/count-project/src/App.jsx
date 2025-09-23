import './App.css';
import { useState } from "react";
import Count from "./Components/Count/count";

export default function App() {
	const [count, setCount] = useState(0)

	function add() {
		setCount(prevCount => prevCount + 1)
	}

	function subtract() {
		setCount(prevCount => prevCount > 0 ? prevCount - 1 : prevCount);
	}

	return (
		<main className="container">
			<div className="counter">
				<button
					className="minus"
					onClick={subtract}
					aria-label="Decrease count"> - </button>

				<Count number={count} />

				<button
					className="plus"
					onClick={add}
					aria-label="Increase count"> + </button>
			</div>
		</main>
	)
}
